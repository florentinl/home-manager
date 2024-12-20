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

    # Programming in Nix
    nixfmt-rfc-style
    nixd
    alejandra

    # Utils
    wl-clipboard

    # Cybersecurity
    ghidra
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

  # Use Wayland Ozone platform for Chromium based apps
  # home.sessionVariables.NIXOS_OZONE_WL = "1";

}
