{
  description = "Home Manager configuration of florentinl";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."florentinl" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          { nixpkgs.config.allowUnfree = true; }
          ./home.nix
          ./gnome.nix
          ./programs
        ];
      };
    };
}
