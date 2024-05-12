NixOS configurations under [home-manager](https://nix-community.github.io/home-manager/index.xhtml) and [nix flakes](https://nix.dev/concepts/flakes).

## Fs structure:
- `flake.nix`: flake entry
- `configuration.nix`: system-wise configurations
- `dotfiles/`: persistent dotfiles for apps
- `hosts`: configuration entrys for different hosts (wsl, laptop, etc.)
- `home-manager/`:
  - `home.nix`: home-manager entry, user-wise common configurations
  - `wsl.nix`: wsl-sepcifical configurations
  - `global/`: per-app configurations entry for every host
  - `wsl/`: per-app configurations entry for wsl