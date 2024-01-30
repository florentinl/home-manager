{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      asvetliakov.vscode-neovim
      github.copilot
      jnoortheen.nix-ide
      github.copilot-chat
    ];
  };
}