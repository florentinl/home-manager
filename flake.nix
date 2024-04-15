{
  description = "Home Manager configuration of florentinl";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    node14-past = {
      url = "github:nixos/nixpkgs?rev=407f8825b321617a38b86a4d9be11fd76d513da2";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    node14-past,
  }: let
    makeConfiguration = {
      configName,
      system,
    }: let
      pkgs = nixpkgs.legacyPackages.${system};
      nodePkgs = node14-past.legacyPackages.${system};
    in {
      "${configName}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit configName;
          inherit nodePkgs;
        };
        modules = [
          ./commons
          ./configurations/${configName}
        ];
      };
    };
    system = "x86_64-linux";
  in {
    formatter."${system}" = nixpkgs.legacyPackages.${system}.alejandra;
    homeConfigurations =
      makeConfiguration {
        configName = "flaptop";
        system = system;
      }
      // makeConfiguration {
        configName = "bsport";
        system = system;
      };
  };
}
