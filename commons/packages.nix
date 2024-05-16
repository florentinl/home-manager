{pkgs, ...}: {
  home.packages = with pkgs; [
    # Applications
    microsoft-edge-dev
    enpass
    neovide

    # Nerd Fonts
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "Monaspace"
      ];
    })

    # Random Tools
    ripgrep
    yq-go
    jq

    # Text Editor

    # GitHub CLI
    gh
    gh-copilot

    # Python
    python3

    # Programming in Nix
    nil
    alejandra
  ];
}
