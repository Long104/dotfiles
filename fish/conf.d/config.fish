if not test -d "$HOME/.tmux/plugins/tpm"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
end
echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish
function fish_user_key_bindings
bind \cp history-search-backward bind \cn history-search-forward
end
# set -U fish_vi_key_bindings fish_vi_key_bindings
set -U fish_user_key_bindings 
set -U fish_greeting # disable fish greeting
bind \cs 'nvim_selectors'


function user_paths
    fish_add_path --path /usr/local/bin /bin /usr/bin /sbin /usr/sbin
    fish_add_path --path /run/current-system/sw/bin fish_add_path --path $HOME/.nix-profile/bin fish_add_path --path $HOME/.local/share/nvim/mason/bin
    fish_add_path --path $HOME/.deno/bin
    fish_add_path --path $HOME/.spicetify
    fish_add_path --path $HOME/.cargo/bin
    fish_add_path --path /opt/homebrew/bin
    set -gx JAVA_HOME "/opt/homebrew/Cellar/openjdk/23.0.1/libexec/openjdk.jdk/Contents/Home"
    set -gx MANPATH /usr/local/man /usr/local/share/man /usr/man /usr/share/man
    set -gx NIX_PROFILES "/nix/var/nix/profiles/default $HOME/.nix-profile"
    set -gx NIX_PATH /nix/var/nix/profiles/per-user/$USER/channels
end
user_paths


if test -e /nix/var/nix/profiles/default/etc/profile.d/nix.fish
        source /nix/var/nix/profiles/default/etc/profile.d/nix.fish
end


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


zoxide init fish | source
# fzf --fish | source
# set -U FZF_COMPLETE = 1, 2, 3
set -U FZF_DEFAULT_OPTS "--height 40"
set -U FZF_COMPLETE 3
set -gx ATUIN_NOBIND "true"
atuin init fish | source
bind \cr _atuin_search
bind -M insert \cr _atuin_search