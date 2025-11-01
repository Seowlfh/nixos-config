{ pkgs, home-manager, unstable }:
{
  "laptop" = home-manager.lib.homeManagerConfiguration {
    modules = [ ./teto/laptop.nix ];
    extraSpecialArgs = {
        inherit unstable;
    };
    inherit pkgs;
  };

  "desktop" = home-manager.lib.homeManagerConfiguration {
    modules = [ ./teto/desktop.nix ];
    extraSpecialArgs = {
        inherit unstable;
    };
    inherit pkgs;
  };
}
