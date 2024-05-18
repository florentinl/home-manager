{
  description = "Home Manager configuration of florentinl";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: let
    pkgs = nixpkgs.legacyPackages.${system};
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
