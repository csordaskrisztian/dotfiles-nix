{
  pkgs,
  theme,
  lib,
  ...
}: let
  bgImageSection = name: ''
    #${name} {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/${name}.png"))
    }
    '';
in {
  programs.wlogout = {
    enable = true;
    style = ''
            * {
      	background-image: none;
      	box-shadow: none;
      }

      window {
      	background-color: transparent;
      }

      button {
        border-radius: 4px;
        color: #${theme.colors.foreground};
      	background-color: #${theme.colors.background};
      	border-style: solid;
      	border-width: 0px;
      	margin: 4px;
      	background-repeat: no-repeat;
      	background-position: center;
      	background-size: 25%;
      }

      button:focus, button:active, button:hover {
      	background-color: #${theme.colors.color4};
      	color: #${theme.colors.background};
      }

      ${lib.concatMapStringsSep "\n" bgImageSection [
        "lock"
        "logout"
        "suspend"
        "hibernate"
        "shutdown"
        "reboot"
      ]}      
    '';
  };
}
