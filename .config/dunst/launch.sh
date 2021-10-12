#!/bin/bash

# Terminate already running dunst instances
killall -q dunst

# Wait until the processes have been shut down
while pgrep -u $UID -x dunst >/dev/null; do sleep 0.3; done

# Launch dunst, using pywal generated template
dunst -config ~/.cache/wal/dunstrc &
