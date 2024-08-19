{ config, lib, ... }:
let
  cfg = config.xdg.autostart;
in
{
  options.xdg.autostart = {
    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
    };
  };

  config = lib.mkIf (cfg.packages != [ ]) {
    home.file = builtins.listToAttrs (
      map (pkg: {
        name = ".config/autostart/${pkg.pname}.desktop";
        value =
          if pkg ? desktopItem then
            { text = pkg.desktopItem; }
          else
            { source = (pkg + "/share/applications/${pkg.pname}.desktop"); };
      }) cfg.packages
    );
  };
}
