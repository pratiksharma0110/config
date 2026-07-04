{ pkgs, ... }:

{
  home.packages = with pkgs; [
+
    gcc
    gnumake
    cmake
    gdb


    nodejs
    npm
    typescript

    
    go

    
    dart
  ];

  programs.git = {
    enable = true;
    userName = ""; 
    userEmail = "";
  };
}
