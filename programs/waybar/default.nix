{ config, pkgs, ... }: {
  programs.waybar.enable = true;

  xdg.configFile."waybar/config.jsonc".source = ./config/config.jsonc;
  xdg.configFile."waybar/style.css".source = ./config/style.css;
}
