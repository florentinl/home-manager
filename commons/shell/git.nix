{ ... }:
{
  programs.git = {
    enable = true;
    # delta.enable = true;

    userName = "Florentin Labelle";
    userEmail = "101594032+florentinl@users.noreply.github.com";

    # Set default branch name to main
    extraConfig = {
      init.defaultBranch = "main";
      gpg.format = "ssh";
      user.signingKey = "~/.ssh/id_ed25519.pub";
      commit.gpgSign = true;
    };
  };
}
