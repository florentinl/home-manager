{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "florentinl";
  home.homeDirectory = "/home/florentinl";

  imports = [
    ./gnome.nix
    ./programs
  ];

  home.packages = with pkgs; [
    microsoft-edge
    enpass

    neovim

    starship
    xclip
    xsel

    cargo
    rustc
    rustfmt
    clippy
    llvmPackages.libclang

    nixd
    nixpkgs-fmt

    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";
}
