{ ... }:

{
  imports = [
    ./impermanence.nix
    ./networking.nix

    ./hardware-configuration.nix
  ];

  virtualisation.vmware.guest.enable = true;
  boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  hardware.graphics.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  system.stateVersion = "25.05";
}
