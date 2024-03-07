{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      material-symbols
      lexend
      source-code-pro

      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Lexend"];
        sansSerif = ["Lexend"];
        monospace = ["Iosevka Nerd Font"];
      };
    };
  };
}
