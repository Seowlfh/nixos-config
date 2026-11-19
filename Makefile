.PHONY: home
home:
	home-manager switch --flake .\#${HOST_TYPE}

.PHONY: host
host:
	sudo nixos-rebuild switch --flake .\#${HOST_TYPE}

.PHONY: update
update:
	nix flake update
	make host
