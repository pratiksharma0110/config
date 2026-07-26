{ config, pkgs, ... }:

let
  programsDir = ./programs;
  files = builtins.readDir programsDir;
  directories = builtins.filter
    (name: files.${name} == "directory")
    (builtins.attrNames files);
  programImports = map (name: programsDir + "/${name}") directories;
in
{
  imports = programImports;

  home.username = "protikbruhh";
  home.homeDirectory = "/home/protikbruhh";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    (writeShellScriptBin "start" ''
      echo "Select window manager:"
      echo "  1) Hyprland"
      echo "  2) Plasma 6"
      read -rp "Choice [1-2]: " choice
      case "$choice" in
        1) exec start-hyprland ;;
        2) exec startplasma-wayland ;;
        *) echo "Invalid choice"; exit 1 ;;
      esac
    '')
  ] ++ (with pkgs; [
  qt6.qt5compat
    spotify
    steam-run
    mesa-demos
    postman
    btop
    wlogout
    discord
    firefox-devedition
    grim
    htop
    hyprlauncher
    kitty
    neovim
    opencode
    quickshell
    ripgrep
    slurp
    swappy
    vim
    mpv
    yazi
    zathura
    antigravity
    fd
    brave
  ]);



  fonts.fontconfig.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "dolphin.desktop" ];
      "text/plain" = [ "nvim.desktop" ];
      "video/mp4" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "application/pdf" = [ "zathura.desktop" ];
      "x-scheme-handler/spotify" = [ "spotify.desktop" ];
      "audio/mpeg" = [ "spotify.desktop" ];

      #browser shits 
       "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
    };
  };

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };

}
