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

brightnessctl
    discord
    firefox-devedition
    grim
    htop
    hypridle
    hyprlauncher
    hyprlock
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
  ];
  programs.home-manager.enable = true;

}
