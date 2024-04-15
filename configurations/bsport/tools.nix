{
  pkgs,
  lib,
  nodePkgs,
  ...
}: {
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
    ms-python.python
    ms-python.isort
    ms-python.black-formatter
    ms-python.vscode-pylance
  ];

  # Additional oh-my-zsh plugins to be installed
  programs.zsh.oh-my-zsh.plugins = [
    "aws"
    "helm"
    "kubectl"
    "argocd"
    "terraform"
  ];

  programs.zsh.envExtra = ''
    export PATH="$HOME/.local/bin:$PATH"
  '';

  programs.git.userEmail = lib.mkForce "florentin@bsport.io";

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
    aws-vault

    # Terraform
    tfswitch
    terraform-ls
    terraform-docs

    # Node
    nodePkgs.yarn
    nodePkgs.nodejs

    # Python
    pipenv

    # Misc
    jq
    dig
    yq-go
  ];
}
