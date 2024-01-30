{ ... }:

{ 
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "CaskaydiaCove Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "CaskaydiaCove Nerd Font";
          style = "Bold";
        };
      };
      keyboard.bindings = [
        # Open a new tab
        { key = "N"; mods = "Control"; action = "SpawnNewInstance"; }
      ];
    };
  };
}
