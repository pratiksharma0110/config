{ config, pkgs, lib, ... }: {
  services.swaync = {
    enable = true;
  };

  xdg.configFile."swaync/config.json".source = ./config.json;
  xdg.configFile."swaync/style.css".source = ./style.css;
}
