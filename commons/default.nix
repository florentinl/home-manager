{...}: {
  imports = [
    ./packages.nix
    ./gnome.nix
    ./programs
  ];

  # Allow unfree packages for Home Manager
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "florentinl";
  home.homeDirectory = "/home/florentinl";

  # Allow unfree packages from the command line
  home.file.".config/nixpkgs/config.nix".text = ''
    {
      allowUnfree = true;
    }
  '';

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
