#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */ 
# This script for selecting wallpapers (SUPER W)

# WALLPAPERS PATH
wallDIR="$HOME/Pictures/wallpaper"

# variables
SCRIPTSDIR="$HOME/.config/hypr/scripts"
focused_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')



# Retrieve image files
PICS=($(find "${wallDIR}" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \)))

# Rofi command
rofi_command="rofi -i -show -dmenu -config ~/.config/rofi/config-wallpaper.rasi"


main() {
  choice=$(menu | ${rofi_command})
  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi


# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi


main

sleep 0.2
# pkill hyprpaper
hyprctl hyprpaper unload all
sleep 0.2
killall hyprpaper
sleep 0.2
hyprpaper &


# echo "preload = /new-wallpaper-path/" >>  /.config/hypr/hyprpaper.conf
# echo "wallpaper =,/new-wallpaper-path/" >>  /.config/hypr/hyprpaper.conf
hyprctl hyprpaper preload "~/wallpapers/wallpaper-1"
hyprctl hyprpaper monitor ",~/wallpapers/wallpaper-1"
echo "splash = true" >~/.config/hypr/hyprpaper.conf
echo "ipc = off" >>~/.config/hypr/hyprpaper.conf
monitors=$(hyprctl monitors -j | jq -r ".[] | .name")

for monitor in $monitors; do
	# wallpaper=$(fd ".png|.jpg|.jpeg" ~/Pictures/wallpaper/ | shuf -n1)
	wallpaper=$(rofi_command ".png|.jpg|.jpeg" ~/Pictures/wallpaper/ | shuf -n1)
	echo "preload = $wallpaper" >>~/.config/hypr/hyprpaper.conf
	echo "wallpaper = $monitor,$wallpaper" >>~/.config/hypr/hyprpaper.conf
done

