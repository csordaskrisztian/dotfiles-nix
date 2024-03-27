{pkgs, ...}: {
  imports = [
    ./yazi.nix
    ./bottom.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    zip
    unzip

    fd
    ripgrep
    killall
    eza
    gnupg
    nitch
    dust
    duf
    fd
    yt-dlp
    cfspeedtest
  ];

  programs = {
    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
