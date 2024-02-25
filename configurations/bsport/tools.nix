{ pkgs, ... }:

{
  # Additional programs to be installed
  programs.direnv.enable = true;

  # Additional vscode extensions to be installed
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    asvetliakov.vscode-neovim
    github.copilot
    jnoortheen.nix-ide
    github.copilot-chat
    piousdeer.adwaita-theme
    ms-kubernetes-tools.vscode-kubernetes-tools
    redhat.vscode-yaml
    hashicorp.terraform
  ];

  # Additional oh-my-zsh plugins to be installed
  programs.zsh.oh-my-zsh.plugins = [
    "aws"
    "helm"
    "kubectl"
    "argocd"
  ];

  # Additional packages to be installed
  home.packages = with pkgs; [
    # Applications
    slack

    # Kubernetes
    kubectl
    kubernetes-helm
    k9s
    argocd

    # AWS
    awscli2
    ssm-session-manager-plugin

    # Terraform
    tfswitch
    terraform-ls

    # Misc
    jq
  ];
}
