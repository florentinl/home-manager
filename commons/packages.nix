{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Applications
    (callPackage (import ./microsoft-edge).stable { })
    enpass

    # Nerd Fonts
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "Monaspace"
      ];
    })

    # Text Editor
    neovide
    ripgrep

    # Programming in Python
    python3
    poetry

    # Programming in Nix
    nixd
    nixpkgs-fmt

    # XML language server
    lemminx
  ];
}
