#!/usr/bin/env bash

# Icons directory
iDIR="$HOME/.local/icons"

# get current value of brightness in percentage
current_val () {
	backlight=$(brightnessctl g)
	value_percent=$(expr $((backlight)) / 75)
	echo $value_percent
}

# Get suitable icon
get_icon() {
	current=$(current_val)
	if [[ ($current -ge 0) && ($current -le 20) ]]; then
		echo "$iDIR/brightness-20.png"
	elif [[ ($current -ge 21) && ($current -le 40) ]]; then
		echo "$iDIR/brightness-40.png"
	elif [[ ($current -ge 41) && ($current -le 60) ]]; then
		echo "$iDIR/brightness-60.png"
	elif [[ ($current -ge 61) && ($current -le 80) ]]; then
		echo "$iDIR/brightness-80.png"
	elif [[ ("$current" -ge 81) && ($current -le 100) ]]; then
		echo "$iDIR/brightness-100.png"
	fi
}

# Notify
notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Brightness : $(current_val)"
}

# Increase brightness
inc_backlight() {
	brightnessctl set 10%+ && get_icon && notify_user
}

# Decrease brightness
dec_backlight() {
	brightnessctl set 10%- && get_icon && notify_user
}

# execute specified option
if [[ "$1" == "--get" ]]; then
	brightnessctl g
elif [[ "$1" == "--up" ]]; then
	inc_backlight
elif [[ "$1" == "--down" ]]; then
	dec_backlight
else
	current_val
fi
