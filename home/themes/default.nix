{
  config,
  lib,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;

    font = {
      name = "Lexend";
      package = pkgs.lexend;
      size = 9;
    };

    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
