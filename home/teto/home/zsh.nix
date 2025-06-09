{ config, pkgs, lib, ... }:

let
  /*
    Create an attribute set from dir, which each name being a directory in dir,
    and each value the full path the this directory. 

    This allows for easely creating aliases to all directories in a directory.
  */
  aliasToDir = dir: 
    (lib.attrsets.mapAttrs 
        (n: v: dir + n)  
        (lib.attrsets.filterAttrs 
          (n: v: v == "directory")
          (builtins.readDir dir)
        )
    );
in
{
  enable = true;
  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-config";
      src = lib.cleanSource ./p10k-config;
      file = "p10k.zsh";
    }
  ];

  shellAliases = {
    conf = "cd ${config.home.homeDirectory}/prog/nixos-config/";
    tool = "cd ${config.home.homeDirectory}/acu/toolchain/";
  } // (aliasToDir "${config.home.homeDirectory}/school/s9/")
    // (aliasToDir "${config.home.homeDirectory}/acu/piscine/");

  autosuggestion.enable = true;

  oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
    ];
  };

  initContent = ''
    # Reeavaluate p10k config
    [[ ! -f ~/.config/home-manager/home/p10k-config/p10k.zsh ]] || source ~/.config/home-manager/home/p10k-config/p10k.zsh

    eval "$(direnv hook zsh)"

    any-nix-shell zsh --info-right | source /dev/stdin
  '';
}
