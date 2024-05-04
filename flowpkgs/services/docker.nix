{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.services.docker;
  settingsFormat = pkgs.formats.json {};
  daemonSettingsFile = settingsFormat.generate "daemon.json" cfg.daemon.settings;
in {
  options.services.docker = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    daemon.settings = lib.mkOption {
      type = settingsFormat.type;
      default = {};
    };
    socket = lib.mkOption {
      type = lib.types.str;
      default = "/run/user/1000/docker.sock";
    };
    context = lib.mkOption {
      type = lib.types.str;
      default = "rootless";
    };
  };

  config =
    lib.mkIf cfg.enable
    (let
      context_sha = builtins.hashString "sha256" cfg.context;
    in {
      home.packages = [
        pkgs.docker_26
        pkgs.docker-credential-helpers
      ];

      # Create a context for the rootless daemon and configure the Docker CLI to use it
      home.file = {
        docker_context = {
          enable = true;
          text =
            builtins.toJSON
            {
              Name = cfg.context;
              Metadata = {};
              Endpoints = {
                docker = {
                  Host = "unix://${cfg.socket}";
                  SkipTLSVerify = false;
                };
              };
            };
          recursive = true;
          target = ".docker/contexts/meta/${context_sha}/meta.json";
        };
        docker_config = {
          enable = true;
          text =
            builtins.toJSON
            {
              auths = {};
              credsStore = "secretservice";
              currentContext = cfg.context;
            };
          target = ".docker/config.json";
        };
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
          ExecStart = "${pkgs.docker_26}/bin/dockerd-rootless --config-file=${daemonSettingsFile}";
          ExecReload = "${pkgs.procps}/bin/kill -s HUP $MAINPID";
          Environment = "PATH=/run/wrappers/bin:/run/current-system/sw/bin";
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
    });
}
