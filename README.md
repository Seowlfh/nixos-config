# nixos-config

My NixOs configuration, featuring:
  - Flakes
  - Multi-host setup

# Installation

```bash
nix-shell -p git --run 'nix develop github:Seowlfh/nixos-config --extra-experimental-features "nix-command flakes"'
sudo nixos-rebuild switch --flake github:Seowlfh/nixos-config
home-manager switch --flake github:Seowlfh/nixos-config
```
