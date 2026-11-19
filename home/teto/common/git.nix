{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "seo";
        email = "seowlfh@laposte.net";
      };
      init = {
        default_branch = "main";
      };
    };
  };
}
