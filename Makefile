.PHONY: home
home:
	home-manager switch --flake .\#${HOST}

.PHONY: host
host:
	sudo nixos-rebuild switch --flake .\#${HOST}

.PHONY: update
update:
	nix flake update
	make host
