{ pkgs, home-manager }:
{
  "teto@laptop" = home-manager.lib.homeManagerConfiguration {
    modules = [ ./teto/laptop.nix ];
    inherit pkgs;
    # extraSpecialArgs = ? ;
  };
}
