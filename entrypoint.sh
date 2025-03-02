#!/bin/sh

tempio -conf /data/options.json -template /carconnectivity.json.gtpl -out /carconnectivity.json
echo "Config is >>>>>>>>>>"
cat /carconnectivity.json
echo "<<<<<<<<<<<<<<<<<<<<"
/opt/venv/bin/carconnectivity-mqtt /carconnectivity.json