{ pkgs, ... }:
{
  programs.nix-index-database.comma.enable = true;

  home.packages = with pkgs; [

    # Applications
    microsoft-edge
    chromium
    teams-for-linux
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

  # Autostart Enpass minimised
  home.file.".config/autostart/Enpass.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Enpass
    Exec= ${pkgs.enpass}/bin/Enpass -minimize
    Icon=enpass.png
    Comment=The best password manager
    X-GNOME-Autostart-Delay=12
    X-GNOME-Autostart-enabled=true
  '';

}
