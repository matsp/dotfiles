#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Setup variables

export BATTERY="$(ls /sys/class/power_supply | grep "BAT")"
export WL_IFACE="$(ip addr | grep ": wlp" | cut -d: -f2 | tr -d ' ')"
export ETH_IFACE="$(ip addr | grep ": enp" | cut -d: -f2 | tr -d ' ')"


# Define $MONITOR variable
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
    MONITOR=$m polybar --reload bottom &
  done
else
  polybar --reload top &
  polybar --reload bottom &
fi


