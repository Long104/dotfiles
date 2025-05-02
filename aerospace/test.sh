while true; do
  is_typing=$(osascript -e '
  tell application "System Events"
  set frontApp to first process whose frontmost is true
  set focusedElement to (value of (attribute "AXFocusedUIElement") of frontApp)
  if focusedElement is missing value then return "false"
    set role to (value of attribute "AXRole" of focusedElement) as text
    return role
  end tell
  ')

# Roles that indicate a text input field
text_roles=("AXTextArea" "AXTextField" "AXComboBox" "AXSearchField")

# Check if the role is a text input field
if [[ " ${text_roles[@]} " =~ " $is_typing " ]]; then
  echo "Cursor is in a text field! Command ignored."
else
  echo "Hint Executed!!"
fi
sleep 1
done
