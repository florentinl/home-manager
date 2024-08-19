{ pkgs, ... }:
{
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
}
