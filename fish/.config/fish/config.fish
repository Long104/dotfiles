if status is-interactive
    # Commands to run in interactive sessions can go here alias n='nvim'
alias cd='z'
alias ls="eza --color=always --icons=always" 
alias lt="eza --color=always --icons=always -T " 
# alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions" 
alias nf="clear && neofetch" 
alias apprun="osascript -e 'tell application \"System Events\" to return name of processes whose background only is false'"
alias psrun='ps ux -p $(osascript -e "tell application \"System Events\" to return unix id of processes whose background only is false")'
alias convert='~/dotfiles/script/.config/script/350-image-to-all.sh'

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
# docker kill $(docker ps -q)
# docker_clean_ps
# docker rmi $(docker images -a -q)

alias git-bare="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias fuck="thefuck"
alias fk="thefuck" # alias pc="ps x -o rss,vsz,command | grep Process" alias chad="NVIM_APPNAME=nvim-nvchad nvim"
alias n="nvim"
alias f="nvim -c ':Telescope find_files'"
alias py-activate="source ~/myenv/bin/activate.fish"
alias py-deactivate="deactivate"
alias cn="NVIM_APPNAME=NvChad nvim" 
alias xen="NVIM_APPNAME=xen nvim"
alias s="NVIM_APPNAME=Shoshinvim nvim"
alias zen="NVIM_APPNAME=ZenVim nvim"
alias v="NVIM_APPNAME=ZenVim nvim"
alias znvim="NVIM_APPNAME=ZenVim nvim"


function nvims
    set items "ZenVim" "default" "Shoshinvim" "neobean" "zenzen" "NvChad" "SnoVim" "NebulaNvim" "javaNvim" "xen" "nvimBlade" "laravelNvim"
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    
    if test -z "$config"
        echo "Nothing selected"
        return 0
    else if test "$config" = "default"
        set config ""
    end
 
    env NVIM_APPNAME=$config nvim $argv
end

# Bind Ctrl+a to the nvims function

# alias n="ln -snf ~/github/nvim/nvim.me ~/.config/nvim && nvim"
alias sf='sesh connect (sesh list | fzf)'

function cj
    # Check if exactly 2 arguments are provided
    if test (count $argv) -ne 2
        echo "Usage: cj <appname> <packagename>"
        return 1
    end

    # Assign the arguments to variables
    set appname $argv[1]
    set packagename $argv[2]

    # Run the Maven command
    mvn archetype:generate -DgroupId=$packagename -DartifactId=$appname -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
end


# set -Ux EDITOR nvim # 'neovim/neovim' text editor
# set -Ux VISUAL nvim

# set orange   d65d0e
# set brorange fe8019
# set bg2      504945
# set bg3      665c54
# set bg4      7c6f64
# 
# set orange   d65d0e
# set brorange fe8019
# set bg2      504945
# set bg3      665c54
# set bg4      7c6f64

# set fish_color_autosuggestion     brblack
# set fish_color_cancel             -r
# set fish_color_command            cyan
# set fish_color_comment            brblack
# set fish_color_cwd                cyan
# set fish_color_cwd_root           brred
# set fish_color_end                $orange
# set fish_color_error              red
# set fish_color_escape             $orange
# set fish_color_history_current    --bold
# set fish_color_host               normal
# set fish_color_match              --background=brblue
# set fish_color_normal            62A
# set fish_color_operator           red
# set fish_color_param              brwhite
# set fish_color_quote              brgreen
# set fish_color_redirection        bryellow
# set fish_color_search_match       --background=$bg2
# set fish_color_selection          -r
# set fish_color_status             red
# #set fish_color_user               brgreen
# set fish_color_valid_path         --underline
# set fish_pager_color_completion   normal
# set fish_pager_color_description  yellow
# set fish_pager_color_prefix       --bold --underline
# set fish_pager_color_progress     brwhite --background=blue

  #TODO: start the terminal
set -U fish_greeting # disable fish greeting
function fish_user_key_bindings
bind \cp history-search-backward
bind \cn history-search-forward
# bind \ca 'nvims\n'
bind \ca 'nvims'
end
# set -U fish_vi_key_bindings fish_vi_key_bindings
set -U fish_user_key_bindings 
   # ---------------
  # Set FZF_DEFAULT_COMMAND to use fd for listing files, excluding .git directories
# set -x FZF_DEFAULT_COMMAND "fd --hidden --exclude .git ."
# set -x FZF_DEFAULT_COMMAND "fd --exclude .git "

# Set FZF_CTRL_T_COMMAND to use fd for listing path candidates
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Set FZF_ALT_C_COMMAND to use fd for listing directories, excluding .git directories
# set -x FZF_ALT_C_COMMAND "fd --type d --hidden --exclude .git ."
set -x FZF_ALT_C_COMMAND "fd --type d --exclude .git "

# Set up preview options for Ctrl+T and Alt+C keybindings
set -x FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
set -x FZF_ALT_C_OPTS "--preview 'eza --tree --color=always {} | head -200'"
# set -x CC gcc
# bind \cj complete
# bind \cj accept-autosuggestion
# fish_vi_key_bindings



if not set -q TMUX
    if tmux has-session -t code
        tmux attach -t code
    else
        tmux new-session -s code
        tmux attach -t code
    end
end


starship init fish | source



set -gx PATH $PATH $GOPATH/bin
set -gx PATH /Users/pantorn/.local/share/ZenVim/mason/bin $PATH
set -gx PATH $HOME/go/bin $PATH
# set -x PATH $PATH /root/.local/share/gem/ruby/3.0.0/bin
end



thefuck --alias | source

fish_add_path /Users/pantorn/.spicetify
