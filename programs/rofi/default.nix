{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    rofi
    rofi-bluetooth
    networkmanager_dmenu
  ];

  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/theme.rasi".source = ./theme.rasi;
  xdg.configFile."rofi/scripts/powermenu.sh".source = ./scripts/powermenu.sh;
}
