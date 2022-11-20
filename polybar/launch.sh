#!/bin/bash

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c ~/.config/polybar/config.ini top 2>&1 | tee -a /tmp/polybar.0.log & disown
polybar -c ~/.config/polybar/config.ini bottom 2>&1 | tee -a /tmp/polybar.1.log & disown
