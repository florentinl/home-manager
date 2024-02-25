{ pkgs, configName, ... }:

{
  programs.bat.enable = true;
  programs.eza.enable = true;

  programs.fzf = {
    enable = true;
  };

  programs.starship = {
    enable = true;
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
      hms = "home-manager switch --flake ~/.config/home-manager#${configName}";
      hme = "code ~/.config/home-manager";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };

    plugins = [
      {
        name = "omz-utils";
        src = pkgs.fetchFromGitHub {
          owner = "florentinl";
          repo = "omz-utils";
          rev = "main";
          sha256 = "FsfMHW35gcEsiMkIU1GUH2nhqn1s7l5Kv8sdwaG6JYA=";
        };
        file = "utils.plugin.zsh";
      }
      {
        name = "kubectl-set-ns";
        src = pkgs.fetchFromGitHub {
          owner = "florentinl";
          repo = "omz-kubectl-set-ns";
          rev = "main";
          sha256 = "ZxhyPcYk7a23G+NYVaM2G+xOrXt5Khpu/QEieYZVdHA=";
        };
        file = "kubectl-set-ns.plugin.zsh";
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "master";
          sha256 = "R30Rb/yxEryFGG527OoFPUVkTQU+Mex4R0D0+iqJQKw=";
        };
        file = "fzf-tab.zsh";
      }
    ];
  };

  # Manage the clipboard from the command line
  home.packages = with pkgs; [
    xclip
    xsel
  ];
}
