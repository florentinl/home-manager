{ pkgs, ... }:
{
  dconf.settings = {
    # Lock screen on suspend
    "org/gnome/desktop/lockdown" = {
      disable-lock-screen = false;
    };

    # Interface
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita";
      enable-hot-corners = false;
    };

    # Mutter
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      workspaces-only-on-primary = false;
    };

    # Extensions
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "BingWallpaper@ineffable-gmail.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "gsconnect@andyholmes.github.io"
        "clipboard-history@alexsaveau.dev"
      ];
    };

    # Keybindings
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };
    "org/gnome/shell/keybindings" = {
      toggle-message-tray = [ "<Super>m" ];
    };
  };

  # Gnome specific packages
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.bing-wallpaper-changer
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gsconnect
    gnomeExtensions.clipboard-history
  ];
}
