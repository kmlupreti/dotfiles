#!/bin/bash

# Define the display name
DISPLAY_NAME="eDP-1"

# Extract the dpmsStatus value
STATUS=$(hyprctl monitors | awk -v display="$DISPLAY_NAME" '
    $0 ~ display {found=1}
    found && /dpmsStatus/ {print $2; exit}
')

# Print the extracted STATUS for debugging
echo "Extracted dpmsStatus: '$STATUS'"

# Check if STATUS is a valid integer and toggle the display accordingly
if [ "$STATUS" = "1" ]; then
    # If the display is on, turn it off
    hyprctl dispatch dpms off "$DISPLAY_NAME"
elif [ "$STATUS" = "0" ]; then
    # If the display is off, turn it on
    hyprctl dispatch dpms on "$DISPLAY_NAME"
else
    echo "Error: Unable to determine dpmsStatus for $DISPLAY_NAME"
fi
