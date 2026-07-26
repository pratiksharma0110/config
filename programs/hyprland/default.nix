{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  xdg.configFile."hypr/hyprland.lua".source = ./config/hyprland.lua;
  xdg.configFile."hypr/hyprlock.conf".source = ./config/hyprlock.conf;

  home.packages = with pkgs; [
    hypridle
    hyprlock
    hyprpaper
    pavucontrol
    wl-screenrec
    awww
    cliphist
    jq
    socat
    pamixer
    brightnessctl
    acpi
    iw
    bluez
    libnotify
    lm_sensors
    bc
    imagemagick
  ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
      lock_cmd = "hyprlock";
      unlock_cmd = "killall -SIGUSR2 hyprlock";
      before_sleep_cmd = "hyprlock";
      after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 60;
          on-timeout = "noctalia msg session lock";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
