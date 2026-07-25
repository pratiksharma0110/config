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

  nixpkgs.config.allowUnfree = true;

  home.username = "protikbruhh";
  home.homeDirectory = "/home/protikbruhh";
  home.stateVersion = "26.05";

home.packages = with pkgs; [
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
    niri
    opencode
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
  ];



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
    };
  };

  programs.home-manager.enable = true;

}
