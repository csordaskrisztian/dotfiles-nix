{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
      installed = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq | sk";
      installedall = "nix-store --query --requisites /run/current-system | sk";
      cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
      listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      nixremove = "nix-store --gc";
      bloat = "nix path-info -Sh /run/current-system";

      tree = "eza --tree";
      l = "eza";
      # eza = "eza -l --sort type --no-permissions --no-user --no-time --header --icons --no-filesize --group-directories-first";
      
    };
  };
}
