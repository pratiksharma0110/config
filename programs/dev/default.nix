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

zed-editor

    # Dart
    dart
    python3

    # Java
    jdk21
    jre

    # Utilities
    unzip


#lsp 
    # Python
  pyright
  ruff
  
  # Go
  gopls
  gotools
  gofumpt
  
  # C/C++
  clang-tools # (provides clangd)

  qt6.qtdeclarative
  
  # Web / JS / TS
  typescript-language-server
  vscode-langservers-extracted # (provides jsonls, html, eslint, etc.)
  
  # General formatting / Shell
  stylua
  shellcheck
  shfmt
];

  programs.git = {
    enable = true;
    settings = {
      user.name = secrets.GIT_USER_NAME or "";
      user.email = secrets.GIT_USER_EMAIL or "";
    };
  };
}
