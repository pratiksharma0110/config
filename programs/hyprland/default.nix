{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
  };

  xdg.configFile."hypr/hyprland.lua".source = ./config/hyprland.lua;

  home.packages = with pkgs; [
    rofi
    pavucontrol
    wl-screenrec
    swww
    wl-clipboard
    cliphist
    jq
    socat
    pamixer
    brightnessctl
    acpi
    iw
    bluez
    libnotify
    networkmanager
    lm_sensors
    bc
    imagemagick
  ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
