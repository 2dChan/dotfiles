_:

{
  imports = [
    ./modules

    ./nix.nix
    ./pkgs.nix
    ./services.nix
    ./security.nix
    ./users.nix
  ];

  boot.loader = {
    timeout = 0;

    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
  };

  time.timeZone = "Europe/Moscow";
}
