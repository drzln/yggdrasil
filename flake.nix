{
  description = "yggdrasil, world system tree";

  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs?branch=release-24.05;
    };
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      yggdrasil = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { };
        modules = [
          ({ pkgs, ... }: {
            system.stateVersion = "24.05";
            networking.hostName = "yggdrasil";
            users.users.luis = {
              isNormalUser = true;
              home = "/home/luis";
              description = "luis";
              packages = [ pkgs.home-manager ];
            };
            time.timeZone = "UTC";
            services.openssh.enable = true;
            home-manager.users.luis = { ... }: {
              programs.home-manager.enable = true;
              home.stateVersion = "24.05";
            };
          })
        ];
      };
    };
  };
}
