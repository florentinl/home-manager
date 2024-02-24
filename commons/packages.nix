{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Applications
    microsoft-edge
    enpass

    # Nerd Fonts
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "Monaspace"
      ];
    })

    # Programming in Python
    python3
    poetry

    # Programming in Nix
    nixd
    nixpkgs-fmt
  ];
}
