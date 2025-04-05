#!/bin/sh
set -e

# Function to handle signals
term_handler() {
    echo "SIGTERM signal received, shutting down..."
    if [ -n "$child_pid" ] && kill -0 "$child_pid" 2>/dev/null; then
        kill -TERM "$child_pid"
        wait "$child_pid"
    fi
    exit 143 # 128 + 15 -- SIGTERM
}

# trap SIGTERM - sent when 'docker stop'
trap 'term_handler' TERM
cd /tmp

echo -e "\n\n\n>>>>>>>>> STARTING\n"
EXPERT_MODE=$(jq -r '.expert' /data/options.json 2>/dev/null)

if [ "$EXPERT_MODE" = "true" ]; then
    echo "⚠️Expert mode is enabled.⚠️"
    if [ -f /config/carconnectivity.expert.json ]; then
        EXPERT_FILE="true"
        echo "✅ File carconnectivity.expert.json exists."
    else
        EXPERT_FILE="false"
        echo "❌ File carconnectivity.expert.json not found."
    fi
    if jq empty /config/carconnectivity.expert.json 2>/dev/null; then
        EXPERT_SYNTAX="true"
        echo "✅ JSON is syntactically correct."
    else
        EXPERT_SYNTAX="false"
        echo "❌ JSON invalid."
    fi
fi

if [ "$EXPERT_MODE" = "true" ] && [ "$EXPERT_FILE" = "true" ] && [ "$EXPERT_SYNTAX" = "true" ]; then
    ln -nfs /config/carconnectivity.expert.json /tmp/carconnectivity.json
    echo "The expert configuration can apply. Let's use it"
else
    echo "The configuration is being generated"
    tempio -conf /data/options.json -template carconnectivity.json.gtpl -out /config/carconnectivity.UI.json
    jq . /config/carconnectivity.UI.json > /config/carconnectivity.UI.json
    ln -nfs /config/carconnectivity.UI.json /tmp/carconnectivity.json
fi

if [ ! -e /tmp/carconnectivity.json ] && [ -L /tmp/carconnectivity.json ]; then
    echo "🚨 Symlink exists, but broken."
fi

DEBUG_LEVEL=$(jq -r '.log_level' /data/options.json 2>/dev/null)
if [ "$DEBUG_LEVEL" = "debug" ] || [ "$EXPERT_MODE" = "true" ]; then
    for file in versions.txt carconnectivity.json; do
        echo ">>>>>>>>> ($file)"
        cat "$file"
        echo "<<<<<<<<<<" 
    done
fi

/opt/venv/bin/carconnectivity carconnectivity.json &
child_pid=$!
echo ">>>>>>>>> STARTED"
wait "$child_pid"
