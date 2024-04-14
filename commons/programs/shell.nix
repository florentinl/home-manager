{
  pkgs,
  lib,
  configName,
  ...
}: {
  programs = {
    bat.enable = true;
    eza.enable = true;
    fzf.enable = true;
    starship.enable = true;
    zoxide.enable = true;
  };

  programs.zellij = {
    enable = true;
    settings = {
      copy_on_select = false;
      default_layout = "compact";
    };
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

      # Python
      export VIRTUAL_ENV_DISABLE_PROMPT=1
    '';

    shellAliases = {
      # Eza
      ll = lib.mkForce "eza -lhF always";
      l = "eza -alhF always";
      # Bat
      cat = "bat";

      # Zellij
      zj = "zellij";
      zja = "zellij attach";
      zjd = "zellij delete-session";
      zjda = "zellij delete-all-sessions";

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
          rev = "v1.0";
          sha256 = "o3R9dh9t8w/SVO3IUeJqP8kkQxwnRjNX8oZ4wSZxBYo=";
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
