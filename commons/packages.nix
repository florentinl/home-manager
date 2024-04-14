{pkgs, ...}: {
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

    # Text Editor
    neovide
    ripgrep

    # Programming in Python
    python3
    poetry

    # Programming in Nix
    nil
    nixpkgs-fmt
  ];
}
