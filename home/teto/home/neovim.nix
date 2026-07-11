{ unstable, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = false;

    package = unstable.neovim-unwrapped;

    sideloadInitLua = true;

    # Deprecation notices
    withPython3 = false;
    withRuby = false;
  };
}
