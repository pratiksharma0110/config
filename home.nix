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

services.kdeconnect.enable = true;


home.packages = with pkgs; [
spotify
niri
steam-run
mesa-demos
postman
btop
brightnessctl
wlogout
    discord
    firefox-devedition
    grim
    htop
    hyprlauncher
    kdePackages.kate
    kitty
    neovim
    opencode
    ripgrep
    slurp
    swappy
    vim
    wl-clipboard
    yazi
    zathura
    antigravity
fd
    # Fonts for status bar icons and emoji
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    rofi
    rofi-bluetooth
    networkmanager_dmenu
brave

];



  fonts.fontconfig.enable = true;

  home.activation.rebuildKDECache = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${pkgs.kdePackages.kservice}/bin/kbuildsycoca6 --noincremental
  '';

  programs.home-manager.enable = true;

}
