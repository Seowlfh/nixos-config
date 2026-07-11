.PHONY: home
home:
	home-manager switch --flake .\#desktop

.PHONY: host
host:
	nixos-rebuild switch --flake .\#desktop
