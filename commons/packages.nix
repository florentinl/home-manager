{ pkgs, ... }:
{
  programs.nix-index-database.comma.enable = true;

  home.packages = with pkgs; [

    # Applications
    microsoft-edge
    enpass
    zed-editor

    # Nerd Fonts
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "Monaspace"
      ];
    })

    # Python
    python3

    # Programming in Nix
    nixfmt-rfc-style
    nixd
    alejandra

    # Utils
    wl-clipboard
  ];

  xdg.autostart.packages = with pkgs; [ enpass ];
}
