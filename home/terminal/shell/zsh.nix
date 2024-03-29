{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    autocd = true;
    syntaxHighlighting = {
      enable = true;
      styles = {"alias" = "fg=magenta";};
      highlighters = ["main" "brackets" "pattern"];
    };
    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake ~/dotfiles-nix";
      home-switch = "home-manager switch --flake ~/dotfiles-nix";
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
