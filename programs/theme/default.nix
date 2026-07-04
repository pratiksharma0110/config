{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    papirus-icon-theme
    kdePackages.breeze-gtk
  ];

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };

  xdg.configFile."kdeglobals".text = ''
    [General]
    ColorScheme=BreezeDark

    [Icons]
    Theme=Papirus-Dark

    [Colors:View]
    Background=35,38,41
    Foreground=239,240,241
    AlternateBackground=30,33,36
  '';

  gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
