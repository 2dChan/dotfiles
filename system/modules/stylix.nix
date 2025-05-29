{
  pkgs,
  ...
}:

let
  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";

in
{
  stylix = {
    enable = true;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code Nerd Font";
      };

      sizes.terminal = 14;
      sizes.desktop = 14;
    };

    cursor = {
      size = 24;
      name = "macOS";
      package = pkgs.whitesur-cursors;

    };

    inherit base16Scheme;
  };
}
