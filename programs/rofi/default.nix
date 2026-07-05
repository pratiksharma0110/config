{ config, lib, ... }: {
  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.configFile."rofi/theme.rasi".source = ./theme.rasi;
  xdg.configFile."rofi/scripts/powermenu.sh".source = ./scripts/powermenu.sh;
}
