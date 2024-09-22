media=(
  icon.background.image=media.artwork
  icon.background.drawing=on
  scroll_texts=on
  updates=on 
  # update_freq=5
  # shadow=on
  icon.padding_right=28
  icon.background.image.corner_radius=10
  icon.background.image.scale=0.68
  script="$PLUGIN_DIR/media.sh"
  label.max_chars=35
  label.padding_right=6
  # label.padding_left=3
  label.font="$FONT:Semibold:10.5"
  # label.padding_right=77
)


sketchybar --add item media right \
           --set media "${media[@]}" \
           --subscribe media media_change\
           
