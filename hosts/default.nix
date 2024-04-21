{ inputs, pkgs, lib, system }:
{
  laptop = lib.nixosSystem {
    modules = [ ./laptop ];
    specialArgs = inputs;
    inherit system;
  };

  desktop = lib.nixosSystem {
    modules = [ ./desktop ];
    specialArgs = inputs;
    inherit system;
  };
}
