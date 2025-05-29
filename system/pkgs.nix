{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
    btop
    git
    wget

    # Fish plugins.
    fishPlugins.autopair
    fishPlugins.sponge
    fishPlugins.tide
    fishPlugins.z
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
    };

    fish = {
      enable = true;

      interactiveShellInit = "set fish_greeting\n";

      shellAliases = {
        nd = "nix develop -c fish";
        nr = "sudo nixos-rebuild --impure";
      };
    };
  };
}
