{pkgs, ...}: {
  imports = [
    ./aws.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    slack

    kubectl
    kubernetes-helm
    argocd
    k9s

    tfswitch
    terraform-ls
  ];

  programs.zsh.oh-my-zsh.plugins = [
    "helm"
    "kubectl"
    "argocd"
    "terraform"
  ];

  programs.git.userEmail = "florentin@bsport.io";

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "florentinl";
  home.homeDirectory = "/home/florentinl";

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
