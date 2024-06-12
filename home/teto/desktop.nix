{ pkgs, unstable, ... }:

let
  lib = pkgs.lib;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "teto";
  home.homeDirectory = "/home/teto";

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = import ./common/packages.nix { inherit pkgs; };


  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/teto/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  xsession.windowManager.i3 = import ./home/i3.nix { inherit pkgs lib true; };

  programs.kitty = import ./home/kitty.nix { inherit pkgs; };
  programs.zsh = import ./home/zsh.nix { inherit pkgs lib; };
  programs.rofi = import ./home/rofi.nix { inherit pkgs; };
  programs.tmux = import ./home/tmux.nix { inherit pkgs; };

  services.polybar = import ./home/polybar.nix { inherit pkgs; };
  services.betterlockscreen = import ./home/betterlockscreen.nix { inherit pkgs; };

  programs.git = {
    enable = true;
    userName = "Theo Gardet";
    userEmail = "theo.gardet@epita.fr";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Compositor
  services.picom.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim = import ./home/neovim.nix { inherit unstable; };

  programs.thunderbird = import ./home/thunderbird.nix;

  programs.autorandr = import ./home/arandr.nix;
}
