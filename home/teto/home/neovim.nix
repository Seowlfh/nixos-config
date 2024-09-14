{ unstable, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    package = unstable.neovim-unwrapped;
  };
}
