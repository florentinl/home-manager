{ pkgs, ... }:

{
  programs.bat.enable = true;
  programs.eza.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    # enableAutosuggestions = true;

    initExtra = ''
      # Set neovim as default editor
      export EDITOR=nvim

      # Starship
      export STARSHIP_CONFIG=~/.config/home-manager/dotfiles/starship.toml
      eval "$(starship init zsh)"
      
      # Rust
      export LIBCLANG_PATH=${pkgs.llvmPackages.libclang.lib}/lib
    '';

    shellAliases = {
      # Eza
      ll = "eza -lhF";
      l = "eza -alhF";
      # Bat
      cat = "bat";

      # NixOS
      nrs = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
      ];
    };
  };
}
