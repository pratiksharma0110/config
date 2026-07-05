#!/usr/bin/env bash

choices="  Shutdown\n  Reboot\n  Lock\n  Logout\n  Suspend"

chosen=$(echo -e "$choices" | rofi -dmenu -p "Power Menu" -theme-str 'window {width: 300px;} listview {lines: 5;}')

case "$chosen" in
    "  Shutdown") systemctl poweroff ;;
    "  Reboot")   systemctl reboot ;;
    "  Lock")     hyprlock || loginctl lock-session ;;
    "  Logout")   hyprctl dispatch exit ;;
    "  Suspend")  systemctl suspend ;;
esac
