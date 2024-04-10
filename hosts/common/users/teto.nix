{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraGroups.vboxusers.members = [ "teto" ];
  users.users.teto = {
    isNormalUser = true;
    description = "teto";
    extraGroups = [ "networkmanager" "wheel" "docker" "tty" "dialout" ];
    packages = with pkgs; [ ];

    shell = pkgs.zsh;
  };
}
