{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    allowSFTP = true;
  };
}
