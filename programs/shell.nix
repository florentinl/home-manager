{ pkgs, ... }:

{
  programs.bat.enable = true;
  programs.eza.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    # enableAutosuggestions = true;

    initExtra = ''
      # Starship
      export STARSHIP_CONFIG=~/.config/home-manager/dotfiles/starship.toml

      # Rust
      export LIBCLANG_PATH=${pkgs.llvmPackages.libclang.lib}/lib
    '';

    shellAliases = {
      # Eza
      ll = "eza -lhF always";
      l = "eza -alhF always";
      # Bat
      cat = "bat";

      # NixOS
      nrs = "sudo nixos-rebuild switch";
      ne = "code /etc/nixos";
      hms = "home-manager switch";
      hme = "code ~/.config/home-manager";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
      ];
    };
  };

  # Manage the clipboard from the command line
  home.packages = with pkgs; [
    xclip
    xsel
  ];
}
