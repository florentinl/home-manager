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
    system = "x86_64-linux";
  in {
    formatter."${system}" = nixpkgs.legacyPackages.${system}.alejandra;
    homeConfigurations."florentinl@flaptop" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./flowpkgs
        ./commons
        ./configurations/${"florentinl@flaptop"}
      ];
    };
    homeConfigurations."florentinl@bsport" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit pkgs23-05;};
      modules = [
        ./flowpkgs
        ./commons
        ./configurations/${"florentinl@bsport"}
      ];
    };
    homeConfigurations."root" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./commons/shell
        ./configurations/root
      ];
    };
  };
}
