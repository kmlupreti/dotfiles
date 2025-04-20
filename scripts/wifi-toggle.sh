#!/bin/bash

# Check if WiFi is currently enabled
wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "enabled" ]; then
    # WiFi is on, turn it off
    nmcli radio wifi off
else
    # WiFi is off, turn it on
    nmcli radio wifi on
fi
