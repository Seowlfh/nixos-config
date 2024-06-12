{ pkgs, home-manager, unstable }:
{
  "teto@laptop" = home-manager.lib.homeManagerConfiguration {
    modules = [ ./teto/laptop.nix ];
    extraSpecialArgs = {
        inherit unstable;
    };
    inherit pkgs;
  };

  "teto@desktop" = home-manager.lib.homeManagerConfiguration {
    modules = [ ./teto/desktop.nix ];
    extraSpecialArgs = {
        inherit unstable;
    };
    inherit pkgs;
  };
}
