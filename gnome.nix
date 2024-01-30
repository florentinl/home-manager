{ pkgs, ... }:

{
  dconf.settings = {
    # Lock screen on suspend
    "org/gnome/desktop/lockdown" = {
      disable-lock-screen = false;
    };


    # Extensions
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "BingWallpaper@ineffable-gmail.com"
        "clipboard-history@alexsaveau.dev"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
      ];
    };


    # Keybindings
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
    };
  };

  # Gnome specific packages
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.bing-wallpaper-changer
    gnomeExtensions.clipboard-history
    gnomeExtensions.blur-my-shell
    gnome.gnome-tweaks
  ];
}
