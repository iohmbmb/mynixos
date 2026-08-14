{
  programs.waybar = {
  enable = true;
  # This tells Waybar to pull its layout entirely from the default system files
  systemd.enable = true; 
  
  settings = {
    mainBar = {
      # Instantly overrides only the clock module from the system layout
      "clock" = {
        format = "{:%I:%M %p}"; # Forces the 12h AM/PM layout!
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };
    };
  };
};

}
