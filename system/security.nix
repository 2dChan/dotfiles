_:

{
  security = {
    polkit.enable = true;

    sudo = {
      enable = true;
      extraConfig = ''
        Defaults        lecture = never
      '';
    };
  };
}
