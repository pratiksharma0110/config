{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.okular
    qt6.qtdeclarative
  ];
}
