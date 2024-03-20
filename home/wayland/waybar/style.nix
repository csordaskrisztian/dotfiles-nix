{theme, ...}: {
  programs.waybar.style = ''
* {
    border: none;
    border-radius: 0px;
    font-family: Cantarell , Symbols Nerd Font Mono;
    font-size: 14px;
    min-height: 0px;
    padding: 0;
    margin: 0;
}


window#waybar {
    background: rgba(22,22,22,1);
    transition-property: background-color;
    transition-duration: .5s;
    color: #${theme.colors.foreground};
    }

tooltip {
    background: #${theme.colors.background};
    color: #${theme.colors.foreground};
    border-radius: 12px;
    border: 1px solid #${theme.colors.color8};
}

#workspaces {
   padding: 9px 5px;
}

#workspaces * {
  font-size: 0px;
}

#workspaces button {
  margin: 2px 2px;
  border-radius: 100%;
  color: transparent;
  background: #${theme.colors.color7};
  transition: all 0.3s ease-in-out;   
  min-width: 8px;
  min-height: 8px;
}

#workspaces button:hover {
  	background-color: #${theme.colors.foreground};
    min-width: 25px;
    border-radius: 18px;
}

#workspaces button.empty {
  background-color: #${theme.colors.color8};
}

#workspaces button.active {
    background-color: #${theme.colors.color4};
    border-radius: 18px;
    min-width: 35px;
    min-height: 10px;
    margin: 1px 2px;
}

#group-grouptray,
#idle_inhibitor,
#custom-notification,
#tray,
#bluetooth,
#pulseaudio,
#network,
#cpu,
#memory,
#clock {
	background: transparent;
	padding: 4px 5px;
	margin: 2px 3px;
  border-radius: 8px;
}


#clock {
    border-radius: 12px;
    margin-top: 0px;
    margin-bottom: 0px;
    font-weight: bold;
    /*border-left: solid 1px #282738;*/
}

#custom-launcher {
    color: #${theme.colors.color4};
    padding: 0px 5px;

    /*border-right: solid 1px #282738;*/
    font-size: 20px;
    font-weight: normal;
}
  '';
}
