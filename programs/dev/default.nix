{ pkgs, ... }:

let
  secrets = if builtins.pathExists ./secrets.nix then import ./secrets.nix else {};
in
{
  home.packages = with pkgs; [
    # C / C++
    gcc
    gnumake
    cmake
    gdb

    # Node.js / JavaScript
    nodejs
    pnpm
    yarn
    typescript

    # Go
    go

    # Dart
    dart
    python3

    # Java
    jdk21
    jre

    # Utilities
    unzip
];

  programs.git = {
    enable = true;
    settings = {
      user.name = secrets.GIT_USER_NAME or "";
      user.email = secrets.GIT_USER_EMAIL or "";
    };
  };
}
