{ config, pkgs, lib, ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "bottom-right";
        notification_limit = 5;
        width = 500;
        height = (0, 300);
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        padding = 15;
        horizontal_padding = 15;
        text_icon_padding = 0;
        frame_width = 1;
        frame_color = "#ffffff14";
        gap_size = 5;
        separator_height = 2;
        separator_color = "auto";
        sort = "yes";
        idle_threshold = 120;
        show_age_threshold = 60;
        monitor = 0;
        follow = "mouse";
        indicate_hidden = "yes";
        transparency = 0;
        show_indicators = "yes";
        icon_position = "left";
        min_icon_size = 64;
        max_icon_size = 64;
        corner_radius = 10;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
        progress_bar_corner_radius = 5;
      };

      urgency_low = {
        background = "#1d1f28a6";
        foreground = "#fdfdfc";
        frame_color = "#ffffff14";
        timeout = 5;
      };

      urgency_normal = {
        background = "#1d1f28a6";
        foreground = "#fdfdfc";
        frame_color = "#ffffff14";
        timeout = 10;
      };

      urgency_critical = {
        background = "#1d1f28a6";
        foreground = "#fdfdfc";
        frame_color = "#ffffff14";
        default_icon = "dialog-warning";
        timeout = 0;
      };

      spotify = {
        appname = "Spotify";
        urgency = "low";
        timeout = 0;
        default_icon = "spotify";
      };
    };
  };
}
