#!/bin/sh
set -euo pipefail

#Variables
TOKEN_FILE="/config/carconnectivity.token"
CACHE_FILE="/config/carconnectivity.cache"
HEALTHY_FILE="/tmp/carconnectivity_healthy"
OPTIONS_JSON="/data/options.json"
EXPERT_MODE=$(jq -r '.expert' ${OPTIONS_JSON} 2>/dev/null || echo "false")
EXPERT_NAME="carconnectivity.expert.json"
UI_NAME="carconnectivity.UI.json"
EXPERT_FILE="/config/${EXPERT_NAME}"
UI_FILE="/config/${UI_NAME}"
EXPERT_EXISTS="false"
EXPERT_SYNTAX="false"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

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
    local name="$(basename ${file})"
    if [ -f "$file" ]; then
        echo -e "${BLUE}📃 ($name) 📃${NC}"
        cat "$file"
        echo -e "${BLUE}-----------${NC}"
    else
        echo -e "${RED}❌ File not found: $file${NC}"
    fi
}

# JSON Verifier
validate_json() {
    local file="$1"
    local name="$(basename ${file})"
    if jq empty "$file" 2>/dev/null; then
        echo -e "${GREEN}✅ File ${name} is syntactically correct.${NC}"
        return 0
    else
        echo -e "${RED}❌ File ${name} is invalid.${NC}"
        return 1
    fi
}

# trap SIGTERM - sent when 'docker stop'
trap 'term_handler' TERM
cd /tmp

echo -e "${CYAN}·············································································\n
${CYAN}:  ____                                             _   _       _ _         :\n
${CYAN}: / ___|__ _ _ __    ___ ___  _ __  _ __   ___  ___| |_(_)_   _(_) |_ _   _ :\n
${CYAN}:| |   / _  | '__|  / _// _ \| '  \| '_ \ / _ \/ __| __| \ \ / / | __| | | |:\n
${CYAN}:| |__| (_| | |    | (_ |(_) | | | | | | |  __/ (__| |_| |\ V /| | |_| |_| |:\n
${CYAN}: \____\__,_|_|    _\___/\___/|_| |_|_| |_|\___|\___|\__|_| \_/ |_|\__|\__, |:\n
${CYAN}:   / \   __| | __| | ___  _ __                                       |___/ :\n
${CYAN}:  / _ \ / _  |/ _  |/ _ \| '_ \                                            :\n
${CYAN}: / ___ \ (_| | (_| | (_) | | | |                                           :\n
${CYAN}:/_/   \_\__,_|\__,_|\___/|_| |_|                                           :\n
${CYAN}·············································································\n
\n${CYAN}⏳ STARTING ⏳ ($(date))${NC}"

if [ "${EXPERT_MODE}" = "true" ]; then
    echo -e "${YELLOW}⚠️ Expert mode is enabled. ⚠️${NC}"

    if [ -f "${EXPERT_FILE}" ]; then
        EXPERT_EXISTS="true"
        echo -e "${GREEN}✅ File ${EXPERT_NAME} exists.${NC}"
    else
        echo -e "${RED}❌ File ${EXPERT_NAME} not found.${NC}"
    fi

    if validate_json "${EXPERT_FILE}"; then
        EXPERT_SYNTAX="true"
    fi
fi

CONFIG_FILE=${UI_FILE}
if [ "${EXPERT_MODE}" = "true" ] && [ "${EXPERT_EXISTS}" = "true" ] && [ "${EXPERT_SYNTAX}" = "true" ]; then
    CONFIG_FILE=${EXPERT_FILE}
    echo -e "${GREEN}🔠 Expert configuration applied.${NC}"
else
    if [ "${EXPERT_MODE}" = "true" ]; then
        if [ "${EXPERT_EXISTS}" != "true" ]; then
            echo -e "${YELLOW}⚠️ Using ${UI_NAME} because ${EXPERT_NAME} is missing.${NC}"
        elif [ "${EXPERT_SYNTAX}" != "true" ]; then
            echo -e "${YELLOW}⚠️ Using ${UI_NAME} because ${EXPERT_NAME} is invalid.${NC}"
        fi
    fi

    echo -e "${BLUE}🛠️ Generating configuration...${NC}"
    tempio -conf "${OPTIONS_JSON}" -template carconnectivity.json.gtpl -out "${UI_NAME}"

    if validate_json "${UI_NAME}"; then
        jq . "${UI_NAME}" > "${CONFIG_FILE}"
    else
        exit 1
    fi
fi

DEBUG_LEVEL=$(jq -r '.log_level'  ${OPTIONS_JSON} 2>/dev/null || echo "info")
echo -e "TYPE=$(hostname)"
print_file versions.txt

if [ "${DEBUG_LEVEL}" = "debug" ] || [ "${EXPERT_MODE}" = "true" ]; then
    print_file ${CONFIG_FILE}
fi

/opt/venv/bin/carconnectivity ${CONFIG_FILE} --tokenfile ${TOKEN_FILE} --cache ${CACHE_FILE} --healthcheckfile ${HEALTHY_FILE} &

child_pid=$!
echo -e "👏 ${GREEN}STARTED (PID: $child_pid)${NC}"
wait "$child_pid"
exit_code=$?
echo -e "${BLUE}ℹ️ Process exited with code $exit_code${NC}"
exit "$exit_code"