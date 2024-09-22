
#!/usr/bin/env sh
RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
if [ "$RUNNING" == "" ]; then
	RUNNING=1
fi
PLAYING=1
TRACK=""
ALBUM=""
ARTIST=""
if [ "$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')" == "playing" ]; then
	PLAYING=0
	TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
	ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
	ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')
fi
if [ $RUNNING -eq 0 ] && [ $PLAYING -eq 0 ]; then
	if [ "$ARTIST" == "" ]; then
		sketchybar --set $NAME label="| $TRACK - $ALBUM |" --set '/spot.*/' drawing=on icon.font='ZeroCode:Regular:7'
	else
		sketchybar --set $NAME label="| $TRACK - $ARTIST |" --set '/spot.*/' drawing=on icon.font='ZeroCode:Regular:7'

	fi
else
	sketchybar --set '/spot.*/' drawing=off
fi


# #!/usr/bin/env sh
#
# # Check if Spotify is running
# RUNNING=$(osascript -e 'if application "Spotify" is running then echo 1 else echo 0')
#
# # Check if Spotify is playing
# if [ "$RUNNING" -eq 1 ]; then
#     PLAYING=$(osascript -e 'tell application "Spotify" to if player state is "playing" then echo 1 else echo 0')
# else
#     PLAYING=0
# fi
#
# # If Spotify is running and playing, fetch track info
# if [ "$RUNNING" -eq 1 ] && [ "$PLAYING" -eq 1 ]; then
#     TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
#     ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
#     ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')
#     COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')
#     curl -s --max-time 20 "$COVER" -o /tmp/cover.jpg
# fi
#
# # Display track info if Spotify is running and playing
# if [ "$RUNNING" -eq 1 ] && [ "$PLAYING" -eq 1 ]; then
#     if [ -z "$ARTIST" ]; then
#         sketchybar --set $NAME label="| $TRACK - $ALBUM |" --set '/spot.*/' drawing=on icon.font='ZeroCode:Regular:20'
#     else
#         sketchybar --set $NAME label="| i |" icon.background.image="/tmp/cover.jpg" icon.background.image.scale=0.9 --set '/spot.*/' drawing=on icon.font='ZeroCode:Regular:20'
#     fi
# else
#     # Handle case when Spotify is not running or not playing
#     :
# fi









           # --set spotify.cover background.image="/tmp/cover.jpg"
#
#
#
#
#
#
#
# # # !/usr/bin/env 
# # RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
# # if [ "$RUNNING" == "" ]; then
# #     RUNNING=1
# # fi
# # PLAYING=1
# # TRACK=""
# # ALBUM=""
# # ARTIST=""
# # COVER=""
# # if [ "$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')" == "playing" ]; then
# #     PLAYING=0
# #     TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
# #     ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
# #     ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')
# #     COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')
# #     curl -s --max-time 20 "$COVER" -o /tmp/cover.jpg
# # fi
# # if [ $RUNNING -eq 0 ] && [ $PLAYING -eq 0 ]; then
# #     if [ "$ARTIST" == "" ]; then
# #         sketchybar --set $NAME label="| $TRACK - $ALBUM |" --set '/spot.*/' drawing=on icon.font='ZeroCode:Regular:20' --set spotify.cover background.image="/tmp/cover.jpg" background.color=0x00000000
# #
# #     else
# #         sketchybar --set $NAME label="| $TRACK - $ARTIST |" --set '/spot.*/' drawing=on icon.font='ZeroCode:Regular:20' --set spotify.cover background.image="/tmp/cover.jpg" background.color=0x00000000
# #     fi
# # fi



#!/usr/bin/env sh

# Check if Spotify is running
# RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
# if [ "$RUNNING" == "" ]; then
#     RUNNING=1
# fi
#
# # Initialize variables
# PLAYING=1
# TRACK=""
# ALBUM=""
# ARTIST=""
# COVER=""
#
# # Check if Spotify is running and playing
# if [ "$RUNNING" -eq 0 ] && [ "$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')" == "playing" ]; then
#     PLAYING=0
#     TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
#     ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
#     ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')
#     COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')
# fi
#
# # Download cover art if available
# if [ "$COVER" != "" ]; then
#     curl -s --max-time 20 "$COVER" -o /tmp/cover.jpg
# fi
#
# # Display track information including cover art if available
# if [ "$RUNNING" -eq 0 ] && [ "$PLAYING" -eq 0 ]; then
#     if [ "$ARTIST" == "" ]; then
#         sketchybar --set $NAME label="| $TRACK - $ALBUM |" --set '/spot.*/' drawing=on icon.font='ZeroCode:Regular:20' --set spotify.cover background.image="/tmp/cover.jpg" background.color=0x00000000
#     else
#         sketchybar --set spotify.cover background.image="/tmp/cover.jpg" 
#     fi
# else
#     sketchybar --set '/spot.*/' drawing=off
# fi








# #!/usr/bin/env sh
#
# # Check if Spotify is running
# RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
# if [ "$RUNNING" == "" ]; then
#     RUNNING=1
# fi
#
# # Initialize variables
# PLAYING=1
# COVER=""
#
# # Check if Spotify is running and playing
# if [ "$RUNNING" -eq 0 ] && [ "$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')" == "playing" ]; then
#     PLAYING=0
#     COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')
# fi
#
# # Download cover art if available
# if [ "$COVER" != "" ]; then
#     curl -s --max-time 20 "$COVER" -o /tmp/cover.jpg
# fi
#
# # Display only the background image if Spotify is running and playing
# if [ "$RUNNING" -eq 0 ] && [ "$PLAYING" -eq 0 ]; then
#     sketchybar --set spotify.cover background.image="/tmp/cover.jpg" 
# else
#     sketchybar --set spotify.cover background.image="/tmp/cover.jpg" 
# fi
#
#
