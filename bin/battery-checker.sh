#!/bin/bash

BATTERY="/sys/class/power_supply/BAT0"

capacity=$(<"$BATTERY/capacity")
status=$(<"$BATTERY/status")

lock="/tmp/battery-low-notified"

if [[ "$status" == "Discharging" && "$capacity" -lt 10 ]]; then
    if [[ ! -e "$lock" ]]; then
        notify-send -u critical "Low Battery" "Battery below 10%."
        touch "$lock"
    fi
else
    rm -f "$lock"
fi
