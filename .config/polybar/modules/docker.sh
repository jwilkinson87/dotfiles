#!/bin/bash

DOCKER_IMAGES = $("docker ps --format="{{.Names}} | "")

MENU="$(rofi -sep "|" -dmenu -i -p 'Running Containers' -location 3 -yoffset 40 -width 15 -hide-scrollbar -line-padding 4 -padding 20 -font "Fantasque Sans Mono 10" -lines 4 <<< " $($DOCKER_IMAGES)")"
            case "$MENU" in
                *Lock) i3lock-fancy ;;
                *Logout) pkill -n polybar ; i3-msg exit ;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac