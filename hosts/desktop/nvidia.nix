{
  # See https://nixos.wiki/wiki/Nvidia
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
  };
}
