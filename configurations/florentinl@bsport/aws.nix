{pkgs, ...}: {
  programs.awscli = {
    enable = true;
    settings = {
      # :TODO:
    };
  };

  home.packages = with pkgs; [
    ssm-session-manager-plugin
  ];

  programs.zsh.oh-my-zsh.plugins = [
    "aws"
  ];
}
