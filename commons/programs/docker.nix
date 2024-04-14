{
  pkgs,
  ...
}:

let
  docker_daemon = "/home/florentinl/.config/docker-daemon.json";
in
{
  home.packages = with pkgs; [docker];

  # Create a configuration file for the rootless daemon
  home.file.docker_daemon = {
    enable = true;
    text = builtins.toJSON {};
    target = docker_daemon;
  };

  # Create a context for the rootless daemon
  home.file.docker_context = {
    enable = true;
    text = ''
    {"Name":"rootless","Metadata":{},"Endpoints":{"docker":{"Host":"unix:///run/user/1000/docker.sock","SkipTLSVerify":false}}}
    '';
    recursive = true;
    target = ".docker/contexts/meta/12b961af5feb3e9d39f93b2cefb9a1a944f18d02cca0cac2f04f5a982240605f/meta.json";
  };

  # Taken from https://github.com/moby/moby/blob/master/contrib/dockerd-rootless-setuptool.sh
  systemd.user.services.docker = {
    Unit = {
      Description = "Docker Application Container Engine (Rootless)";
    };
    Install = {
      WantedBy = ["default.target"];
    };
    Service = {
      Type = "notify";
      ExecStart = "${pkgs.docker}/bin/dockerd-rootless --config-file=${docker_daemon}";
      ExecReload = "${pkgs.procps}/bin/kill -s HUP $MAINPID";
      TimeoutSec = 0;
      RestartSec = 2;
      Restart = "always";
      StartLimitBurst = 3;
      LimitNOFILE = "infinity";
      LimitNPROC = "infinity";
      LimitCORE = "infinity";
      Delegate = true;
      NotifyAccess = "all";
      KillMode = "mixed";
    };
  };
}
