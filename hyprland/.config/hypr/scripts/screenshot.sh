# #!/bin/bash
#
# selec() {
# slurp | grim -g - ~/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png')   
# }
#
# screen() {
# grim  ~/Pictures/$(date +'screenshot_%Y-%m-%d-%H%M%S.png') 
# }
#
#
# if [[ "$1" == "--select" ]]; then
#   selec
# elif [[ "$1" == "--screen" ]]; then
#   screen	
# else
# 	echo -e "nothing"
# fi
#

#!/bin/bash

copy_to_clipboard() {
    local file=$1
    # wl-copy < "$file"
    local home=$(echo "$HOME" | sed 's:/:\\/:g')  # Escape '/' in HOME variable
    local path=$(echo "$file" | sed "s:$home:~:")  # Replace home directory with '~'
    echo -n "$path" | wl-copy
}

good() {
    local file=~/Pictures/$(date +'%screenshot_%Y-%m-%d-%H%M%S.png')
    slurp | grim -g - "$file"
    copy_to_clipboard "$file"
}

screen() {
    local file=~/Pictures/$(date +'%screenshot_%Y-%m-%d-%H%M%S.png')
    grim "$file"
    copy_to_clipboard "$file"
}

if [[ "$1" == "--select" ]]; then
    good
elif [[ "$1" == "--screen" ]]; then
    screen
else
    echo "Usage: $0 --select | --screen"
fi
