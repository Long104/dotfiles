{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./touch-id.nix
  ];
  environment = {
    systemPackages = [
      pkgs.fastfetch
      # shell
      pkgs.nushell
      # Linting
      pkgs.alejandra
      pkgs.hadolint
      # javascript runtime
      pkgs.bun
      pkgs.deno
      # rust
      # pkgs.cargo
      # pkgs.rustc
      #
      pkgs.atuin
      pkgs.yazi
      pkgs.sesh
      pkgs.gum
      pkgs.neovim
      # git
      pkgs.lazygit
      # cli
      pkgs.ani-cli
      pkgs.atac
      pkgs.ollama
      pkgs.starship
      pkgs.pipx
      pkgs.kubernetes-helm
      pkgs.ytfzf
      pkgs.lazydocker
      pkgs.ueberzugpp
      pkgs.dive
      # 1Password has to be installed system-wide
      # _1password
      pkgs.vim
      pkgs.zoxide
      pkgs.ripgrep
      pkgs.fd
      pkgs.curl
      pkgs.eza
      pkgs.fzf
      # pkgs.nodejs_22
      pkgs.zig
      pkgs.go
      pkgs.bat
      pkgs.pam-reattach
      pkgs.tmux
      pkgs.htop
      # tui
      pkgs.smassh
    ];
    pathsToLink = ["/Applications"];
  };
  # services = {
  #   nix-daemon.enable = true;
  # };
  system.primaryUser = "pantornchuavallee";

  # programs = {
  #   zsh = {
  #     enable = true;
  #     # enableCompletion = false;
  #     # enableBashCompletion = false;
  #   };
  # };

  networking = {
    # hostName = "eve";
    # computerName = "Eve";
  };

  fonts = {
    # packages = with pkgs; [(nerdfonts.override {fonts = ["JetBrainsMono"];})];
  };

  system = {
    defaults = {
      NSGlobalDomain = {
        AppleFontSmoothing = 2;
        # NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        # NSAutomaticPeriodSubstitutionEnabled = false;
        AppleInterfaceStyle = "Dark";
        "com.apple.mouse.tapBehavior" = 1;
      };

      # screencapture.location = "~/Pictures/screenshots";
      # screensaver.askForPasswordDelay = 10;

      dock = {
        autohide = true;
        mru-spaces = false;
        autohide-delay = 0.1;
        # autohide-time-modifier = 0.0;
        # minimize-to-application = true;
        show-recents = false;
        static-only = true;
      };
      finder = {
        FXPreferredViewStyle = "clmv";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        ShowPathbar = true;
        CreateDesktop = false;
      };
      loginwindow = {
        LoginwindowText = "zen way";
        GuestEnabled = false;
        # DisableConsoleAccess = true;
      };
      LaunchServices.LSQuarantine = false;
      spaces.spans-displays = false;
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  security.pam.enableSudoTouchId = true;
}
