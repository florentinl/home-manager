{ ... }:

{
  programs.git = {
    enable = true;
    delta.enable = true;

    userName = "Florentin Labelle";
    userEmail = "florentin@bsport.io";

    # Set default branch name to main
    extraConfig = {
      init.defaultBranch = "main";
      gpg.format = "ssh";
      user.signingKey = "~/.ssh/id_ed25519.pub";
      commit.gpgSign = true;
    };
  };
}
