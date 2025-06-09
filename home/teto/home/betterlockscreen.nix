{ pkgs, ... }:
{
  # FIXME: betterlockscreen fails to verify my password every time.
  enable = false;

  arguments = [ "--lock" ];
}
