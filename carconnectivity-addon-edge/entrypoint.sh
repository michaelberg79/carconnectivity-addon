#!/bin/sh
set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check required commands
for cmd in jq tempio cat; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo -e "${RED}❌ Command '$cmd' not found. Aborting.${NC}"
        exit 1
    fi
done

# Function to handle signals
term_handler() {
    echo -e "${YELLOW}SIGTERM signal received, shutting down...${NC}"
    if [ -n "${child_pid:-}" ] && kill -0 "$child_pid" 2>/dev/null; then
        kill -TERM "$child_pid"
        wait "$child_pid"
    fi
    exit 143 # 128 + 15 -- SIGTERM
}

# Function to print file with header and footer
print_file() {
    local file="$1"
    if [ -f "$file" ]; then
        echo -e "${BLUE}📃 ($file) 📃${NC}"
        cat "$file"
        echo -e "${BLUE}-----------${NC}"
    else
        echo -e "${RED}❌ File not found: $file${NC}"
    fi
}

# trap SIGTERM - sent when 'docker stop'
trap 'term_handler' TERM
cd /tmp

echo -e "${CYAN}·············································································\n
${CYAN}:  ____                                             _   _       _ _         :\n
${CYAN}: / ___|__ _ _ __    ___ ___  _ __  _ __   ___  ___| |_(_)_   _(_) |_ _   _ :\n
${CYAN}:| |   / _ | '__|  / __// _ \| '_ \| '_ \ / _ \/ __| __| \ \ / / | __| | | |:\n
${CYAN}:| |__| (_| | |    | (_| (_) | | | | | | |  __/ (__| |_| |\ V /| | |_| |_| |:\n
${CYAN}: \____\__,_|_|    _\___\___/|_| |_|_| |_|\___|\___|\__|_| \_/ |_|\__|\__, |:\n
${CYAN}:   / \   __| | __| | ___  _ __                                       |___/ :\n
${CYAN}:  / _ \ / _ | / _ | / _ \| '_ \                                            :\n
${CYAN}: / ___ \ (_| | (_| | (_) | | | |                                           :\n
${CYAN}:/_/   \_\__,_|\__,_|\___/|_| |_|                                           :\n
${CYAN}·············································································\n
\n${CYAN}⏳ STARTING ⏳ ($(date))${NC}"

EXPERT_MODE=$(jq -r '.expert' /data/options.json 2>/dev/null || echo "false")
EXPERT_FILE="false"
EXPERT_SYNTAX="false"
if [ "$EXPERT_MODE" = "true" ]; then
    echo -e "${YELLOW}⚠️ Expert mode is enabled. ⚠️${NC}"

    if [ -f /config/carconnectivity.expert.json ]; then
        EXPERT_FILE="true"
        echo -e "${GREEN}✅ File carconnectivity.expert.json exists.${NC}"
    else
        echo -e "${RED}❌ File carconnectivity.expert.json not found.${NC}"
    fi

    if jq empty /config/carconnectivity.expert.json 2>/dev/null; then
        EXPERT_SYNTAX="true"
        echo -e "${GREEN}✅ JSON is syntactically correct.${NC}"
    else
        echo -e "${RED}❌ JSON invalid.${NC}"
    fi
fi

if [ "$EXPERT_MODE" = "true" ] && [ "$EXPERT_FILE" = "true" ] && [ "$EXPERT_SYNTAX" = "true" ]; then
    ln -nfs /config/carconnectivity.expert.json /tmp/carconnectivity.json
    echo -e "${GREEN}🔠 Expert configuration applied.${NC}"
else
    echo -e "${BLUE}🛠️ Generating configuration...${NC}"
    tempio -conf /data/options.json -template carconnectivity.json.gtpl -out /tmp/carconnectivity.UI.json
    jq . /tmp/carconnectivity.UI.json > /config/carconnectivity.UI.json
    ln -nfs /config/carconnectivity.UI.json /tmp/carconnectivity.json
fi

DEBUG_LEVEL=$(jq -r '.log_level' /data/options.json 2>/dev/null || echo "info")
echo -e "TYPE=$(hostname)"
print_file versions.txt

if [ "$DEBUG_LEVEL" = "debug" ] || [ "$EXPERT_MODE" = "true" ]; then
    print_file carconnectivity.json
fi

/opt/venv/bin/carconnectivity carconnectivity.json &
child_pid=$!
echo -e "👏 ${GREEN}STARTED${NC} (PID: $child_pid)"
wait "$child_pid"
exit_code=$?
echo -e "${BLUE}ℹ️ Process exited with code $exit_code${NC}"
exit "$exit_code"