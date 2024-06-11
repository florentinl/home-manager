{pkgs, ...}: {
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
    nil
    alejandra

    # Utils
    wl-clipboard
  ];
}
