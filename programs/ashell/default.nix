{ config, pkgs, ... }:
{
  programs.ashell = {
    enable = true;

    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };

    settings = {
      position = "Top";
      layer = "Top";

      modules = {
        left = [ "Workspaces" "WindowTitle" ];
        center = [ "MediaPlayer" ];
        right = [ "SystemInfo" [ "Tray" "Tempo" "Settings" ] ];
      };

      workspaces = {
        visibility_mode = "MonitorSpecific";
      };

      window_title = {
        mode = "Title";
        truncate_title_after_length = 50;
      };

      media_player = {
        max_title_length = 50;
      };

      system_info = {
        indicators = [ "Cpu" "Memory" { Disk = "/"; Name = "Root"; } "Temperature" ];
        interval = 5;
      };

      tempo = {
        clock_format = "%a %d %b %R";
      };

      settings = {
        lock_cmd = "hyprlock &";
        audio_sinks_more_cmd = "pavucontrol -t 3";
        audio_sources_more_cmd = "pavucontrol -t 4";
        wifi_more_cmd = "nm-connection-editor";
        bluetooth_more_cmd = "nm-connection-editor";

        indicators = [
          "IdleInhibitor"
          "PowerProfile"
          "Audio"
          "Microphone"
          "Bluetooth"
          "Network"
          "Vpn"
          "Battery"
          "Brightness"
        ];
      };

      appearance = {
        style = "Islands";
        font_name = "JetBrainsMono Nerd Font";
        scale_factor = 1.15;
        primary_color = "#7aa2f7";
        success_color = "#77DD77";
        text_color = "#7aa2f7";

        workspace_colors = [ "#7aa2f7" ];

        danger_color = {
          base = "#f53c3c";
          weak = "#ffbe61";
        };

        background_color = {
          base = "#000000";
          weak = "#0a0a0a";
          strong = "#141414";
        };

        menu = {
          opacity = 0.95;
        };
      };
    };
  };

  home.packages = with pkgs; [
    hyprpicker
    networkmanagerapplet
  ];
}
