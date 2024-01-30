{ ... }:

{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./shell.nix
    ./vscode.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
