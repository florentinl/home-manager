{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "florentinl";
  home.homeDirectory = "/home/florentinl";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Applications
    microsoft-edge
    enpass
    slack

    # Kubernetes
    kubectl
    kubernetes-helm
    k9s
    jq
    argocd

    # AWS
    awscli2
    ssm-session-manager-plugin

    # Direnv
    direnv

    # Terraform
    tfswitch
    terraform-ls

    # Nerd Fonts
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "CascadiaMono"
        "Monaspace"
      ];
    })

    # Programming in Python
    python3
    poetry

    # Programming in Nix
    nixd
    nixpkgs-fmt
  ];

  # Allow unfree packages from the command line
  home.file.".config/nixpkgs/config.nix".text = ''
    {
      allowUnfree = true;
    }
  '';

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
