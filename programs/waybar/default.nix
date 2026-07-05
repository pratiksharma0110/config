{ config, pkgs, ... }:
let
  powerdrawScript = pkgs.writeShellScript "powerdraw.sh" (builtins.readFile ./scripts/powerdraw.sh);
  checkupdateScript = pkgs.writeShellScript "checkupdate.sh" (builtins.readFile ./scripts/checkupdate.sh);
  colorpickerScript = pkgs.writeShellScript "colorpicker.sh" (builtins.readFile ./scripts/colorpicker.sh);
in {
  # programs.waybar.enable = true;

  # xdg.configFile."waybar/config.jsonc".source = ./config/config.jsonc;
  # xdg.configFile."waybar/style.css".source = ./config/style.css;
  # xdg.configFile."waybar/scripts/powerdraw.sh".source = powerdrawScript;
  # xdg.configFile."waybar/scripts/checkupdate.sh".source = checkupdateScript;
  # xdg.configFile."waybar/scripts/colorpicker.sh".source = colorpickerScript;
}
