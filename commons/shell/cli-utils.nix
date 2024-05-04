{pkgs, ...}: {
  programs = {
    bat.enable = true;
    eza.enable = true;
    fd.enable = true;
    ripgrep.enable = true;
    jq.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
  };
  home.packages = with pkgs; [
    yq-go
  ];
}
