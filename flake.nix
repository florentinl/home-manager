{
  description = "Home Manager configuration of florentinl";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs23-05.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs23-05,
    home-manager,
  }: let
    makeConfiguration = {
      configName,
      system,
    }: let
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs23-05 = import nixpkgs23-05 {
        inherit system;
        config = {
          permittedInsecurePackages = [
            "nodejs-14.21.3"
            "openssl-1.1.1w"
          ];
        };
      };
    in {
      "${configName}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit configName pkgs23-05;};
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
