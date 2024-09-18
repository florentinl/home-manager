{ pkgs, lib, ... }:
{
  home.sessionVariables.VIRTUAL_ENV_DISABLE_PROMPT = "1";
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;

    shellAliases = {
      # Eza Aliases
      ll = lib.mkForce "eza -lhF always";
      l = "eza -alhF always";
      cat = "bat";

      # NixOS/Home Manager Aliases :TODO: Move to a separate plugin
      nrs = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
    };

    localVariables = {
      ZLE_RPROMPT_INDENT = "0";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "utils"
      ];
      custom = "$HOME/.config/home-manager/commons/shell/zsh_custom";
    };

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.1.2";
          sha256 = "Qv8zAiMtrr67CbLRrFjGaPzFZcOiMVEFLg1Z+N6VMhg=";
        };
        file = "fzf-tab.zsh";
      }
    ];
  };
}
