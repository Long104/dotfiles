#!/bin/bash
# sketchybar --add item spot right \
#            --set spot  \
#                       icon.drawing=off \
#                       updates=on \
#                      update_freq=3\
#                       label.drawing=on \
#                       scroll_texts=on \
#                       icon.font='ZeroCode:Regular:8.0' \
#                       background.padding_left=0\
#                       background.color=0xff3C3E4F \



sketchybar --add item spot right \
           --set spot update_freq=3 \
                      icon.drawing=off \
                      updates=on \
                      label.max_chars=20 \
                      icon.font='ZeroCode:Regular:3.0' \
                      background.padding_left=0
                      # script="~/.config/sketchybar/plugins/spotifyNew.sh" \






# $CONFIG_DIR/helper/helper $HELPER > /dev/null 2>&1 &
#
# PLUGIN_DIR="$CONFIG_DIR/plugins" # Directory where all the plugin scripts are stored

#!/bin/bash
#
# spotify_cover=(
#   script="$PLUGIN_DIR/spotifyNew.sh"
#   label.drawing=off
#   icon.drawing=off
#   # padding_left=12
#   # padding_right=10
#   background.image.scale=0.2
#   background.image.drawing=on
#   background.drawing=on
#   background.image.corner_radius=9
#   shadow=on
# )
#                 # update_freq=2\
#                       # updates=on \
# sketchybar --add item spot spotify.cover right \
#            --set spot  \
#                       icon.drawing=on \
#                       label.drawing=on \
#                       label.max_chars=60 \
#                       scroll_texts=off \
#                       icon.font='ZeroCode:Regular:8.0' \
#                       script="~/.config/sketchybar/plugins/spotifyNew.sh" \
#            --set spotify.cover "${spotify_cover[@]}"
#                       # background.padding_left=0\
#
spotify_cover=(
  script="$PLUGIN_DIR/spotifyNew.sh"
 label.drawing=off
 icon.drawing=off
  # ... rest of the spotify_cover configuration
)

sketchybar --add item spotify.cover right \
          --set spotify.cover "${spotify_cover[@]}"
