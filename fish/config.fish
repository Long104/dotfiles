    # Ensure Nix profile is added to the PATH only once
    set -gx PATH $HOME/.nix-profile/bin /usr/local/bin /usr/bin /bin

    # Set Nix-specific variables
    set -gx NIX_PROFILES "/nix/var/nix/profiles/default $HOME/.nix-profile"
    set -gx NIX_PATH /nix/var/nix/profiles/per-user/$USER/channels

    # Source Nix environment for Fish shell, if the file exists
    if test -e /nix/var/nix/profiles/default/etc/profile.d/nix.fish
        source /nix/var/nix/profiles/default/etc/profile.d/nix.fish
    end
