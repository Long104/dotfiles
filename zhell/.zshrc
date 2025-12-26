if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof 
fi

if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
# else
    # echo "TPM is already installed."
fi

export PATH="/usr/local/bin:/usr/bin:$PATH"
# export $(grep -v '^#' ~/dotzen/.env | xargs)
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.spicetify:$PATH"
export PATH="/Users/pantornchuavallee/.cargo/bin:$PATH"

export JAVA_HOME="/opt/homebrew/Cellar/openjdk/23.0.1/libexec/openjdk.jdk/Contents/Home"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# Load starship with zinit
# zinit wait lucid light-mode for \
#     as"command" from"gh-r" atload'eval "$(starship init zsh)"' \
#     starship/starship \




# zinit wait lucid light-mode from"gh-r" as"command" for \
#      atload'
#         eval "$(snm env zsh)"
#         alias n="snm"
#     ' mv'snm* -> snm' pick'snm/snm' \
#         @numToStr/snm \



# # Add LuaRocks binaries to PATH
# eval "$(luarocks path --bin)"
#
# # Set the library path for Homebrew libraries
# export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"



# Add in zsh plugins
# zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions

zinit wait lucid for \
    light-mode blockf atpull'zinit creinstall -q .' \
    atinit"
        # Completion styling
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
    " \
        zsh-users/zsh-completions \
    light-mode atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    light-mode atinit"
        typeset -gA FAST_HIGHLIGHT;
        FAST_HIGHLIGHT[git-cmsg-len]=100;
        zpcompinit;
        zpcdreplay;
    " \
        zdharma-continuum/fast-syntax-highlighting \
        Aloxaf/fzf-tab




# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



# Aliases
alias own="sudo chown -R pantornchuavallee:staff ."
alias ff="clear;wezterm imgcat ~/dotfiles/fastfetch/logos/zen.png --width 26 --height 10 --position 0,9 | fastfetch --raw - --logo-width 20 --logo-height 8"
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias cd='z'
alias ls="eza --color=always --icons=always"
alias lt="eza --color=always --icons=always -T "
# alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias nf="clear && neofetch"
alias apprun="osascript -e 'tell application \"System Events\" to return name of processes whose background only is false'"
alias psrun='ps ux -p $(osascript -e "tell application \"System Events\" to return unix id of processes whose background only is false")'
# alias convert='~/dotfiles/script/.config/script/350-image-to-all.sh'
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker_clean_cache_x='docker buildx prune -f'
alias docker_clear_cache='docker builder prune'
alias git-bare="git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias n="nvim"
alias f="nvim -c ':Telescope find_files'"
alias py-activate="source ~/myenv/bin/activate.fish"
alias py-deactivate="deactivate"
alias s="NVIM_APPNAME=Shoshinvim nvim"
alias start="time ZSH_DEBUGRC=1 zsh -i -c exit"
alias la="eza -a"
alias dr="darwin-rebuild switch --flake ~/dotfiles/nix-darwin"
alias cat="bat"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin" alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb="git branch"
alias gba="git branch -a"
alias gadd="git add"
alias ga="git add -p"
alias gcoall="git checkout -- ."
alias gr="git remote"
alias gre="git reset"

# kubectl
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kv="kubectl config view --minify | grep namespace"
alias knd="kubectl config set-context --current --namespace=default"


# switcher

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layo
ut=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"


if [ -z "$TMUX" ]; then
    # Check if the tmux session 'code' exists
    if tmux has-session -t code💻 2>/dev/null; then
        tmux attach -t code💻
    else
        tmux new-session -s code💻
    fi
fi

 # Nix

export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
export NIX_CONF_DIR=$HOME/.config/nix
 if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
	 . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
 fi
 # End Nix


# Shell integrations
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi



# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/pantornchuavallee/.lmstudio/bin"

. "$HOME/.local/bin/env"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
export NODE_OPTIONS="--no-experimental-warning"
