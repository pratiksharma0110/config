{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "sudo"
        "web-search"
        "extract"
      ];
    };
    shellAliases = {
      nix-update = "sudo nixos-rebuild switch --flake /etc/nixos#nixOS";
    };
  };
}
