{
  description = "yggdrasil, world system tree";

  inputs = { };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      yggdrasil = nixpkgs.lib.nixosSystem {
        system = "x86_64";
        specialArgs = { };
        modules = [
          ({ pkgs, ... }: {
            networking.hostName = "yggdrasil";
            users.uers.luis = {
              isNormalUser = true;
              home = "/home/luis";
              description = "luis";
            };
            time.timeZone = "UTC";
            services.openssh.enable = true;
          })
        ];
      };
    };

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
