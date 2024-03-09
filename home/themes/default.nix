{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.pointerCursor = {
    # name = "Bibata-Modern-Ice";
    # package = pkgs.bibata-cursors;
    # size = 16;
    name = "Qogir";
    size = 24;
    package = pkgs.qogir-icon-theme;
    gtk.enable = true;
  };

  gtk = {
    enable = true;

    font = {
      name = "Lexend";
      package = pkgs.lexend;
      size = 9;
    };

    theme = {
      # name = "Orchis-Dark";
      # package = pkgs.orchis-theme;
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # cursorTheme = {
    #   name = "Bibata-Modern-Ice";
    #   package = pkgs.bibata-cursors;
    # };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
