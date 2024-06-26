# `sudo nixos-rebuild --flake .#<host>` to build system for different hosts.
{
  description = "dbv's NixOS flake";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];
    # extra-substituters = [ "https://nix-community.cachix.org" ];
    # extra-trusted-public-keys = [
    #   "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    # ];
  };

  inputs = {
    dotfiles = {
      url = "path:./dotfiles";
      flake = false;
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs@{ self, dotfiles, nixpkgs, nixpkgs-unstable, nixos-wsl, home-manager, ... }:
    let
      me = "dbv";
      specialArgs = { inherit inputs me; };
      common-modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = {
            inherit me inputs dotfiles;
          };
        }
        # nix-ld.nixosModules.nid-ld
        # { programs.nix-ld.dev.enable = true; }
      ];
    in
    {
      nixosConfigurations = {
        wsl = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";
          modules = common-modules ++ [ nixos-wsl.nixosModules.wsl ./hosts/wsl.nix ];
        };
      };
    };
}
