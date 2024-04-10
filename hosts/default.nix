{ pkgs, lib, system }:
{
  laptop = lib.nixosSystem {
    modules = [ ./laptop ];
    inherit system;
  };
}
