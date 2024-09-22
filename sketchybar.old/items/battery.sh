#!/bin/bash

battery=(
  script="$PLUGIN_DIR/batteryNew.sh"
  icon.font="$FONT:Regular:12.5"
  padding_right=0
  padding_left=0
  label.drawing=off
  update_freq=120
  updates=on
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
