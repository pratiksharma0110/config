{ config, pkgs, ... }: {
  programs.ashell = {
    enable = true;

    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };

    settings = {
      position = "Top";
      layer = "Top";

      outputs = "All";

      enable_esc_key = true;

      osd = {
        enabled = true;
        timeout = 1500;
        show_volume_percentage = true;
        show_brightness_percentage = true;
      };

      blur = {
        enabled = true;
        size = 6;
        passes = 2;
        new_optimized_render = true;
      };

      animations = {
        enabled = true;
      };

      modules = {
        left = [ "Workspaces" "WindowTitle" ];
        center = [ "MediaPlayer" ];
        right = [ "SystemInfo"  [ "Tray" "Tempo" "Privacy" "Settings" ] ];
      };

      window_title = {
        mode = "Title";
        truncate_title_after_length = 100;
      };

      system_info = {
        indicators = [ "Cpu" "Memory" "Temperature" ];
        interval = 5;
        cpu = {
          warn_threshold = 60;
          alert_threshold = 80;
        };
        memory = {
          warn_threshold = 70;
          alert_threshold = 85;
        };
      };

      tempo = {
        clock_format = "%a %d %b %R";
        weather_indicator = "IconAndTemperature";
      };

      notifications = {
        format = "%H:%M";
        show_timestamps = true;
        show_bodies = true;
        toast = true;
        toast_position = "TopRight";
        toast_timeout = 5000;
        toast_limit = 5;
      };

      settings = {
        lock_cmd = "hyprlock &";
        indicators = [ "IdleInhibitor" "PowerProfile" "Audio" "Microphone" "Bluetooth" "Network" "Vpn" "Battery" "Brightness" ];
        audio_sinks_more_cmd = "pavucontrol -t 3";
        audio_sources_more_cmd = "pavucontrol -t 4";
        wifi_more_cmd = "nm-connection-editor";
        bluetooth_more_cmd = "blueberry";
      };

      appearance = {
        style = "Islands";
        font_name = "Sans";
        scale_factor = 1.0;
        opacity = 0.85;
        border_color = "#b4befe";
        primary_color = "#b4befe";
        success_color = "#a6e3a1";
        warning_color = "#f9e2af";
        danger_color = "#f38ba8";
        text_color = "#cdd6f4";
        workspace_colors = [ "#b4befe" "#a6e3a1" "#cba6f7" "#f9e2af" "#f38ba8" "#89b4fa" "#94e2d5" ];
        background_color = {
          base = "#11111b";
          weak = "#11111b";
          strong = "#313244";
        };
        menu = {
          opacity = 0.9;
          backdrop = 0.4;
        };
      };
    };
  };
}
