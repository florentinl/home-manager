{ pkgs, lib, ... }:
{
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
      VIRTUAL_ENV_DISABLE_PROMPT = "1"; # This will be managed by Starship instead
      ZLE_RPROMPT_INDENT = "0";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
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
}
