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

    # GitHub CLI
    gh
    gh-copilot

    # Glab CLI
    glab

    # Programming in Nix
    nil
    nixpkgs-fmt
  ];
}
