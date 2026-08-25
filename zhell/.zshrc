
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# if [ -n "${ZSH_DEBUGRC+1}" ]; then
#     zmodload zsh/zprof 
# fi

if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
# else
    # echo "TPM is already installed."
fi

# pnpm global bin path for mise integration
# export PNPM_HOME="$HOME/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME/bin:"*) ;;
#   *) export PATH="$PNPM_HOME/bin:$PATH" ;;
# esac
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME/bin:$PATH"

export PATH="/usr/local/bin:/usr/bin:$PATH"
# export $(grep -v '^#' ~/dotzen/.env | xargs)
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.spicetify:$PATH"
# export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$HOME/.local/bin:$PATH"

export PATH="/Users/pantornchuavallee/.cargo/bin:$PATH"

export JAVA_HOME="/opt/homebrew/Cellar/openjdk/23.0.1/libexec/openjdk.jdk/Contents/Home"
export VISUAL="nvim"
export EDITOR="nvim"

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

zi ice depth=1; zi light romkatv/powerlevel10k
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
alias awake='sudo pmset -a disablesleep 1 && echo "☕ Mac awake — lid close OK"'
alias sleep-now='sudo pmset -a disablesleep 0 && echo "😴 Sleep restored"'
alias p="pnpm"
alias t="tldr"
alias oc="opencode 2> >(grep -v 'unknown format' >&2)"
alias own="sudo chown -R pantornchuavallee:staff ."
alias ff="clear;wezterm imgcat ~/dotfiles/fastfetch/logos/zen.png --width 26 --height 10 --position 0,9 | fastfetch --raw - --logo-width 20 --logo-height 8"
alias ls='ls --color'
alias vim='nvim'
# alias c='clear'
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

ulimit -n 65536

# Custom function to safely move files to macOS Trash
trash() {
  for file in "$@"; do
    if [ -e "$file" ]; then
      # Get absolute path
      abs_path=$(abspath() { cd "$(dirname "$1")" && printf "%s/%s\n" "$PWD" "$(basename "$1")"; }; abspath "$file")
      osascript -e "tell application \"Finder\" to move (POSIX file \"$abs_path\") to trash" > /dev/null
    else
      echo "trash: $file: No such file or directory"
    fi
  done
}

# Redirect the rm command to use the trash function instead
alias rm='trash'


# switcher

# function nvims() {
#   items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
#   config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layo
# ut=reverse --border --exit-0)
#   if [[ -z $config ]]; then
#     echo "Nothing selected"
#     return 0
#   elif [[ $config == "default" ]]; then
#     config=""
#   fi
#   NVIM_APPNAME=$config nvim $@
# }
#
# bindkey -s ^a "nvims\n"


# if [ -z "$TMUX" ]; then
#     # Check if the tmux session 'code' exists
#     if tmux has-session -t code💻 2>/dev/null; then
#         tmux attach -t code💻
#     else
#         tmux new-session -s code💻
#     fi
# fi

 # Nix

# export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
# export NIX_CONF_DIR=$HOME/.config/nix
#  if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
# 	 . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
#  fi
 # End Nix


# Shell integrations
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(mise activate zsh)"
bindkey '^F' autosuggest-accept

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# if [ -n "${ZSH_DEBUGRC+1}" ]; then
#     zprof
# fi

# . "$HOME/.local/bin/env"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
export PATH="$HOME/bin:$PATH"

# libpq client for remote Postgres/Neon connections
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


# Headroom Context Optimization Proxy (Full Extras)
headroom-start() {
    if lsof -i :8787 -P 2>/dev/null | grep -q LISTEN; then
        echo "Headroom is already running on :8787"
        headroom doctor 2>/dev/null | grep -E "proxy|version|savings"
        return 0
    fi
    echo "Starting Headroom proxy with full extras..."
    /Users/pantorn/.local/share/uv/tools/headroom-ai/bin/python -c "
import subprocess
subprocess.Popen(
    ['headroom', 'proxy', '--port', '8787', '--openai-api-url', 'http://127.0.0.1:20128/v1', '--code-aware', '--lossless', '--memory', '--memory-storage=project', '--learn'],
    stdin=subprocess.DEVNULL, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, start_new_session=True
)
"
    sleep 8
    if lsof -i :8787 -P 2>/dev/null | grep -q LISTEN; then
        echo "✅ Headroom running on :8787"
    else
        echo "❌ Headroom failed to start"
    fi
}
alias headroom-stop="kill \$(lsof -t -i:8787 2>/dev/null) 2>/dev/null && echo 'Headroom stopped' || echo 'Headroom not running'"
alias headroom-restart="headroom-stop && sleep 2 && headroom-start"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
export PATH="$HOME/.local/bin:$PATH"
