{pkgs, ...}: {
  home.packages = with pkgs; [
    # Applications
    microsoft-edge
    floorp
    enpass
    neovide

    # Nerd Fonts
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "Monaspace"
      ];
    })

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
