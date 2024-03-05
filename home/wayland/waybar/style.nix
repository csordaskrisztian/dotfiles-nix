{theme, ...}: {
  programs.waybar.style = ''
* {
    border: none;
    border-radius: 0px;
    font-family: JetBrainsMono Nerd Font;
    font-size: 14px;
    font-style: normal;
    min-height: 0px;
    padding: 0;
    margin: 0;
    background: transparent;
}


window#waybar {
    background: rgba(20,27,30,.7);
    transition-property: background-color;
    transition-duration: .5s;
    color: #${theme.colors.color7};
    padding: 0.3rem;
    }

tooltip {
    background: #${theme.colors.background};
    color: #${theme.colors.foreground};
    border-radius: 12px;
    border-width: 0px;
}

#workspaces {
   padding: 8px 5px;
   border-radius: 12px;
}

#workspaces button {
  padding: 0px 5px;
  margin: 0px 3px;
  border-radius: 22px;
  color: transparent;
  background: #${theme.colors.color8};
  transition: all 0.3s ease-in-out;   
}

#workspaces button:hover {
  	background-color: #${theme.colors.color6};
}

#workspaces button.active {
    background-color: #${theme.colors.color1};
    min-width: 45px;
}

#tray,
#bluetooth,
#pulseaudio,
#network,
#cpu,
#memory,
#clock {
	background: transparent;
	padding: 0px 3px;
	margin: 0px 5px;
  border-radius: 8px;
}

#clock {
    border-radius: 12px;
    padding-left: 3px;
    padding-right: 15px;
    margin-right: 0px;
    margin-left: 10px;
    margin-top: 0px;
    margin-bottom: 0px;
    font-weight: bold;
    /*border-left: solid 1px #282738;*/
}

#custom-launcher {
    color: #${theme.colors.color6};
    padding: 0px 15px 0px 10px;

    /*border-right: solid 1px #282738;*/
    font-size: 20px;
}
  '';
}
