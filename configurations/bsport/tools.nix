{ pkgs }:

{
  # Additional programs to be installed
  programs.direnv.enable = true;

  # Additional vscode extensions to be installed
  programs.vscode.extensions = with pkgs; [
    # Kubernetes
    ms-kubernetes-tools.vscode-kubernetes-tools
    redhat.vscode-yaml
    hashicorp.terraform
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
    terrarform-ls

    # Misc
    jq
  ];
}
