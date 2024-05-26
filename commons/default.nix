{...}: {
  imports = [
    ./gnome.nix
    ./nixvim
    ./packages.nix
    ./shell
    ./vscode.nix
    ./zellij.nix
  ];

  # Allow unfree packages for Home Manager
  nixpkgs.config.allowUnfree = true;

  # Allow unfree packages from the command line
  home.file.".config/nixpkgs/config.nix".text = ''
    {
      allowUnfree = true;
    }
  '';

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
