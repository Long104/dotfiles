if not test -d "$HOME/.tmux/plugins/tpm"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
end
# echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish
# grep -qxF 'source (brew --prefix asdf)/libexec/asdf.fish' ~/.config/fish/config.fish || echo -e "\nsource (brew --prefix asdf)/libexec/asdf.fish" >> ~/.config/fish/config.fish
# if not set -q ASDF_LOADED
#     set -g ASDF_LOADED 1
#     source /opt/homebrew/opt/asdf/libexec/asdf.fish
# end
function fish_user_key_bindings
bind \cp history-search-backward 
bind \cn history-search-forward
bind \cv beginning-of-line
end
# set -U fish_vi_key_bindings fish_vi_key_bindings
set -U fish_user_key_bindings 
set -U fish_greeting # disable fish greeting
bind \cs 'nvim_selectors'

ulimit -n 65535

function user_paths
    fish_add_path --path /usr/local/bin /bin /usr/bin /sbin /usr/sbin
    # fish_add_path --path /opt/homebrew/opt/openjdk/bin 
    fish_add_path --path /opt/homebrew/bin
    fish_add_path --path /opt/homebrew/sbin
    fish_add_path --path /run/current-system/sw/bin fish_add_path --path $HOME/.nix-profile/bin fish_add_path --path $HOME/.local/share/nvim/mason/bin
    fish_add_path --path $HOME/.deno/bin
    fish_add_path --path $HOME/.spicetify
    fish_add_path --path $HOME/.cargo/bin
    fish_add_path --path $HOME/.local/bin
    fish_add_path --path $HOME/go/bin
    fish_add_path --path /opt/homebrew/bin/python3.13
    # fish_add_path --path /Users/pantornchuavallee/Library/Python/3.9/bin
    # fish_add_path --path /opt/homebrew/anaconda3/bin
    # set -gx JAVA_HOME "/opt/homebrew/Cellar/openjdk/23.0.2/libexec/openjdk.jdk/Contents/Home"
    set -gx JAVA_HOME "/opt/homebrew/opt/java"
    set -gx MANPATH /usr/local/man /usr/local/share/man /usr/man /usr/share/man
    set -gx NIX_PROFILES "/nix/var/nix/profiles/default $HOME/.nix-profile"
    set -gx NIX_PATH /nix/var/nix/profiles/per-user/$USER/channels
    set -gx DYLD_LIBRARY_PATH /opt/homebrew/lib
    set -gx DOCKER_BUILDKIT 1
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end
user_paths


if test -e /nix/var/nix/profiles/default/etc/profile.d/nix.fish
        source /nix/var/nix/profiles/default/etc/profile.d/nix.fish
end


# if status --is-interactive
#     # Check if inside a tmux session
#     if not set -q TMUX
#         # Attempt to attach or create a new session
#         if tmux has-session 2>/dev/null
#             tmux attach default
#         else
#             tmux new -s default
#         end
#     end
# end

if status --is-interactive
    # Check if inside a tmux session
    if not set -q TMUX
        # Attempt to attach or create a new session
        if tmux has-session 2>/dev/null
            tmux attach
        else
            tmux new -s default
        end
    end
end


direnv hook fish | source
zoxide init fish | source
mise activate fish | source


# fzf --fish | source
# set -U FZF_COMPLETE = 1, 2, 3
set -U FZF_DEFAULT_OPTS "--height 40"
set -U FZF_COMPLETE 2
set -gx ATUIN_NOBIND "true"
atuin init fish | source
bind \cr _atuin_search
bind -M insert \cr _atuin_search
# bind -M normal \cr _atuin_search


