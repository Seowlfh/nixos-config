{ pkgs , lib , ... }:

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

  dirHashes = {
    cpp = "$HOME/yaka/cpp_workshop/";
  };

  enableAutosuggestions = true;

  oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
    ];
  };

  initExtra = ''
  # Reeavaluate p10k config
  [[ ! -f ~/.config/home-manager/home/p10k-config/p10k.zsh ]] || source ~/.config/home-manager/home/p10k-config/p10k.zsh

  eval "$(direnv hook zsh)"
  '';
}
