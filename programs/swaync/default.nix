{ config, pkgs, ... }:
{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "user";
      notification-icon-size = 40;
      notification-body-image-height = 0;
      notification-body-image-width = 0;
      timeout = 7;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      relative-time = true;
      control-center-margin-top = 4;
      control-center-margin-bottom = 4;
      control-center-margin-right = 4;
      control-center-margin-left = 4;
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 1;
          text = "No new notifications";
        };
        mpris = {
          image-size = 48;
          image-radius = 8;
        };
        volume = {
          label = "Volume";
        };
        backlight = {
          label = "Brightness";
        };
        buttons-grid = {
          actions = [
            {
              label = "";
              command = "hyprpicker -a";
            }
            {
              label = "󰹑";
              command = "grim -g \"$(slurp -d)\"";
            }
            {
              label = "";
              command = "hyprlauncher";
            }
          ];
        };
      };
    };
    style = ''
      * {
        all: unset;
        font-family: "Noto Sans", sans-serif;
      }

      .control-center {
        background: rgba(17, 17, 27, 0.92);
        border: 1px solid rgba(69, 71, 90, 0.5);
        border-radius: 14px;
        padding: 8px 10px;
        min-width: 200px;
        max-width: 300px;
        min-height: 400px;
      }

      .notification-row {
        outline: none;
        margin: 3px 0;
        border-radius: 10px;
        background: rgba(30, 30, 46, 0.8);
        padding: 6px 8px;
      }

      .notification-row:hover {
        background: rgba(49, 50, 68, 0.8);
      }

      .notification .title {
        color: #cdd6f4;
        font-weight: 600;
        font-size: 13px;
      }

      .notification .body {
        color: #a6adc8;
        font-size: 12px;
      }

      .notification-default-action,
      .notification-action {
        margin: 0;
        padding: 0;
        border: none;
        background: transparent;
      }

      .notification-icon {
        margin-right: 6px;
      }

      .notification-icon > image {
        border-radius: 8px;
      }

      .widget-title {
        color: #cdd6f4;
        font-weight: 600;
        font-size: 14px;
        margin: 0 0 6px 0;
      }

      .widget-title button {
        background: rgba(69, 71, 90, 0.6);
        border-radius: 6px;
        padding: 2px 10px;
        color: #cdd6f4;
        font-size: 12px;
      }

      .widget-title button:hover {
        background: rgba(137, 180, 250, 0.3);
      }

      .widget-dnd {
        background: rgba(30, 30, 46, 0.8);
        border-radius: 10px;
        margin: 4px 0;
        padding: 6px 8px;
      }

      .widget-dnd > label {
        color: #cdd6f4;
        font-size: 13px;
      }

      .widget-dnd > switch {
        background: rgba(69, 71, 90, 0.6);
        border-radius: 10px;
      }

      .widget-label {
        margin: 6px 0;
        color: #6c7086;
        font-size: 12px;
      }

      .widget-mpris {
        background: rgba(30, 30, 46, 0.8);
        border-radius: 10px;
        margin: 4px 0;
        padding: 6px 8px;
        color: #cdd6f4;
      }

      .widget-mpris > box > image {
        border-radius: 8px;
      }

      .widget-buttons-grid {
        margin: 4px 0;
      }

      .widget-buttons-grid > button {
        background: rgba(69, 71, 90, 0.4);
        border-radius: 10px;
        padding: 6px;
        color: #cdd6f4;
        font-size: 16px;
        min-width: 36px;
        min-height: 30px;
      }

      .widget-buttons-grid > button:hover {
        background: rgba(137, 180, 250, 0.25);
      }

      .widget-volume {
        background: rgba(30, 30, 46, 0.8);
        border-radius: 10px;
        margin: 4px 0;
        padding: 6px 8px;
        color: #cdd6f4;
        font-size: 13px;
      }

      .widget-backlight {
        background: rgba(30, 30, 46, 0.8);
        border-radius: 10px;
        margin: 4px 0;
        padding: 6px 8px;
        color: #cdd6f4;
        font-size: 13px;
      }

      slider {
        all: unset;
        background: rgba(69, 71, 90, 0.6);
        border-radius: 10px;
        min-height: 5px;
      }

      slider trough {
        background: rgba(69, 71, 90, 0.6);
        border-radius: 10px;
      }

      slider highlight {
        background: #89b4fa;
        border-radius: 10px;
      }

      slider slider {
        background: #cdd6f4;
        border-radius: 100%;
        min-width: 12px;
        min-height: 12px;
      }
    '';
  };
}
