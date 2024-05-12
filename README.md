NixOS configurations under [home-manager](https://nix-community.github.io/home-manager/index.xhtml) and [nix flakes](https://nix.dev/concepts/flakes).

## Fs structure:
- `flake.nix`: Flake entry. Define system dependencies and configuration structures.
- `configuration.nix`: System-wise configurations and package installations. Would be imported by every `hosts/<host>.nix`.
- `dotfiles/`: Persistent dotfiles for apps.
- `hosts\`: Configuration entrys for different hosts (wsl, laptop, etc.).
  - `wsl.nix`: WSL configuration entry.
- `home-manager/`:.
  - `home.nix`: User-wise common configurations and package installations. Would be imported by every `home-manager/<host>.nix`.
  - `wsl.nix`: WSL-sepcifical configurations and package installations.
  - `global/`: Per-app configurations entry for every host.
  - `wsl/`: Per-app configurations entry for wsl.