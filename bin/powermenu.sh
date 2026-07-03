#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Logout\n Reboot" | wofi -i --dmenu -c ~/.config/wofi/powermenu.conf -s ~/.config/wofi/powermenu.css | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                ;&
        reboot)
                loginctl $op
                ;;
        logout)
                riverctl exit
                ;;
esac
