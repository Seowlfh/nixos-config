{ pkgs, lib, system }:
{
  laptop = lib.nixosSystem {
    modules = [ ./laptop ];
    inherit system;
  };

  desktop = lib.nixosSystem {
    modules = [ ./desktop ];
    inherit system;
  };
}
