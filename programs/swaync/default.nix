{ config, pkgs, lib, ... }: {
  services.swaync.enable = true;

  xdg.configFile."swaync/config.json".source = lib.mkForce ./config/config.json;
  xdg.configFile."swaync/style.css".source = ./config/style.css;
}
