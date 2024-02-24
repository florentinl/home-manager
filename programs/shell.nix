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

      # Add tfswitch directory to PATH
      export PATH=$PATH:~/bin

      # Direnv
      eval "$(direnv hook zsh)"
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

      # Git
      gsq = "git reset --soft HEAD~1 && git commit --amend -C HEAD";

      # Bsport
      assume-dev = "bash ~/Projects/devops/bsport-terraform/scripts/assume-role -a arn:aws:iam::348800970639:role/BSPORT-DEV-EUW3-POWERUSER-ROLE -c BSPORT-DEV-EUW3-EKS-CLUSTER-IPV6";
      assume-staging = "bash ~/Projects/devops/bsport-terraform/scripts/assume-role -a arn:aws:iam::046487906865:role/BSPORT-STAGING-EUW3-READONLY-ROLE -c BSPORT-STAGING-EUW3-EKS-CLUSTER";
      assume-prod-new = "bash ~/Projects/devops/bsport-terraform/scripts/assume-role -a arn:aws:iam::672633452901:role/BSPORT-PROD-EUW3-ADMIN-ROLE -c BSPORT-PROD-EUW3-EKS-CLUSTER-IPV6";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
        "kubectl"
        "helm"
        "terraform"
        "aws"
      ];
    };
  };

  # Manage the clipboard from the command line
  home.packages = with pkgs; [
    xclip
    xsel
  ];
}
