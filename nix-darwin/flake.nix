{
  description = "My Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    darwin,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    configuration = {pkgs, ...}: {
      users.users.pantornchuavallee = {
        home = "/Users/pantornchuavallee";
        shell = pkgs.zsh;
      };

      nix = {
        settings = {
          allowed-users = ["root" "pantornchuavallee"];
          trusted-users = ["root" "pantornchuavallee"];
          experimental-features = ["nix-command" "flakes"];

          # https://github.com/NixOS/nix/issues/7273
          auto-optimise-store = false;

          # needed for devenv to enable cachix
          accept-flake-config = true;
        };
        gc = {
          automatic = true;
          interval = {
            Hour = 12;
          };
          options = "--delete-old";
        };
      };

      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      # system.stateVersion = "24.11";
      # nixpkgs.hostPlatform = "x86_64-darwin";
      nixpkgs.hostPlatform = "aarch64-darwin";

      # nix.configureBuildUsers = true;
    };
  in {
    darwinConfigurations."Pantorns-MacBook-Air" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs {system = "aarch64-darwin";};
      specialArgs = {inherit inputs;};
      modules = [
        ./machines/zen/configuration.nix

        configuration

        # home-manager.darwinModules.home-manager
        # {
        #   home-manager = {
        #     useGlobalPkgs = true;
        #     useUserPackages = true;
        #     # makes all inputs available in imported files for hm
        #     extraSpecialArgs = {inherit inputs;};
        #     users.pantornchuavallee = {...}: {
        #       # imports = [shared ./home-manager/eve];
        #       imports = [./home.nix];
        #       home.file.".hushlogin".text = "";
        #       home.stateVersion = "23.05"; # Please read the comment before changing.
        #     };
        #   };
        # }
      ];
    };

    darwinPackages = self.darwinConfigurations."Pantorns-MacBook-Air".pkgs;
  };
}
