{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      material-symbols
      lexend
      source-code-pro

      maple-mono-NF
      maple-mono-SC-NF

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
        monospace = ["Maple Mono SC NF"];
      };
    };
  };
}
