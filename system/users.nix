{ pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users = {
      kitotavrik = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.fish;

        hashedPasswordFile = "/persist/users/kitotavrik/password";
        openssh.authorizedKeys.keyFiles = [
          "/persist/users/kitotavrik/nika-authorized-key"
        ];
      };
    };
  };
}
