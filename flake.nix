{
    description = "Home Manager configuration of marco";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs { 
            system = "x86_64-linux"; 
            config.allowUnfree = true; 
            config.permittedInsecurePackages = [
                "electron-24.8.6"
            ];
            overlays = [
                (final: prev: {
                    obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
                })
            ];
        };
    in {
        homeConfigurations."marco" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home.nix ];
        };
    };
}
