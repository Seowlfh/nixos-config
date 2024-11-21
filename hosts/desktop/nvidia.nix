{
  # See https://wiki.nixos.org/wiki/NVIDIA
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
}
