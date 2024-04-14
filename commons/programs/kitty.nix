{ ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "CaskaydiaCove Nerd Font";

    keybindings = {
      "f11" = "toggle_fullscreen";
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
    };
  };
}
