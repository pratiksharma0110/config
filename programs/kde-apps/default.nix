{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.okular
    qt6.qtdeclarative
    xdg-utils
    shared-mime-info
  ];

  home.activation.rebuildKDECache = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${pkgs.kdePackages.kservice}/bin/kbuildsycoca6 --noincremental
  '';

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "KDE";
    XDG_MENU_PREFIX = "plasma-";
  };
}
