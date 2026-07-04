{ config, pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        padding = {
          top = 2;
        };
      };
      display = {
        separator = " → ";
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "battery"
        "localip"
        "bluetooth"
        "separator"
        "colors"
      ];
    };
  };
}
