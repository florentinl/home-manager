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
      makeConfiguration = { configName, system }:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          "${configName}" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = { inherit configName; };
            modules = [
              ./commons
              ./configurations/${configName}
            ];
          };
        };
      system = "x86_64-linux";
    in
    {
      homeConfigurations = makeConfiguration { configName = "flaptop"; system = system; } //
        makeConfiguration { configName = "bsport"; system = system; };
    };
}
