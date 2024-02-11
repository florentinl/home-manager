{ ... }:

{
  imports = [
    ./alacritty.nix
    # ./firefox.nix I am still using Microsoft Edge waiting for passkey support
    ./git.nix
    ./neovim.nix
    ./shell.nix
    ./vscode.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
