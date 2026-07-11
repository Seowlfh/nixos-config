.PHONY: home
home:
	home-manager switch --flake .\#desktop

.PHONY: host
host:
	sudo nixos-rebuild switch --flake .\#desktop

.PHONY: update
update:
	nix flake update
	make host
