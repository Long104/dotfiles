#!/bin/bash

# Check if the current app is a text editor or input field
is_typing=$(osascript -e 'tell application "System Events" to get name of first process whose frontmost is true')

# List of apps where typing is expected
typing_apps=("TextEdit" "Google Chrome" "Safari" "iTerm2" "Terminal" "Code")

# Check if the current app is in the list
if [[ " ${typing_apps[@]} " =~ " ${is_typing} " ]]; then
  echo "Cursor is typing, command ignored"
else
  warpd --hint
fi
