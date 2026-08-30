{ ... }: ''
  @import "colors.css";

  /* 1. Make the main overall bar completely transparent */
  window#waybar {
    background-color: transparent;
    font-family: "GeistMono Nerd Font";
    font-size: 18px;
    color: @foreground;
  }

  /* 2. Style the Left Piece (Workspaces) */
  .modules-left {
    background-color: transparent;
    border-radius:0;
    padding: 0;
    margin-top:0;
  }

  #workspaces {
    background-color: @background;
    border-radius: 12px;
    padding: 0 10px;
    margin-top: 8px;
    margin-left: 12px;
  }

  #workspaces button {
    color: @color1;
    background: transparent;   
    padding: 4px 10px;
    margin: 0 2px;
    box-shadow: none;
    text-shadow: none;
  }

  #workspaces button.active {
    color: @color2;
    background: transparent;
  }

  #workspaces button:hover {
    color: @color3;
    background: transparent;   
    box-shadow: none;
    border: none;
    border-color: transparent;
  }

  /* 3. Style the Center Piece (Clock) */
  .modules-center {
    background-color: @background;
    border-radius: 12px;
    padding: 0 15px;
    margin-top: 8px;
  }

  /* 4. Style the Right Piece (System Indicators) */
  .modules-right {
    background-color: transparent;
    border-radius:0;
    padding: 0;
    margin-top:0;
  }

  /* Spacing fix for the items inside your right pill */
  #pulseaudio, #backlight, #battery, #network, #tray {
    background-color: @background;
    padding: 0 10px;
    margin-top: 8px;
  }

  #pulseaudio {
    border-radius: 12px 0px 0px 12px
  }

  #tray {
    border-radius: 12px;       /* Pill shape */
    padding: 2px 10px;
    margin-left: 25px;         /* Creates the visual separation gap */
    margin-right: 12px;
  }

  #network {
    border-radius: 0px 12px 12px 0px
  }

  #battery.warning {
    color: #fabd2f;            /* Yellow warning */
  }

  #battery.critical:not(.charging) {
    color: #fb4934;            /* Red critical warning */
    animation-name: blink;     /* Optional blink effect */
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
  }

  #custom-weather {
    background-color: @background;
    color: @foreground;
    border-radius: 12px;    
    padding: 4px 12px;
    margin-top: 8px;
    margin-left: 15px; 
  }
''
