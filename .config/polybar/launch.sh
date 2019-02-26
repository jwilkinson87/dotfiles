#!/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=HDMI-1 TRAY_POSITION=right polybar topbar &
MONITOR=eDP-1 TRAY_POSITION=none polybar topbar &
MONITOR=DP-2 TRAY_POSITION=none polybar topbar &

#polybar topbar &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #MONITOR=$m polybar --reload topbar &
  done
else
  #polybar --reload topbar &
fi
