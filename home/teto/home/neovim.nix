{ unstable, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = false;

    package = unstable.neovim-unwrapped;
  };
}
