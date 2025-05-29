_:

{
  networking = {
    hostName = "dari";
    extraHosts = ''
      127.0.0.1 UNKNOWN.localdomain
    '';
  };

  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";

      UseDns = false;
    };
  };
}
