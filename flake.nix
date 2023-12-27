{
  description = "yggdrasil, world system tree";

  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs?branch=release-24.05;
    };
    home-manager = {
      url = github:drzln/home-manager?branch=release-23.05;
      # home-manager's nixpkgs dependency is the same as ours
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      yggdrasil = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { };
        modules = [
          home-manager.nixosModules.home-manager
          ({ pkgs, ... }: {
            system.stateVersion = "24.05";
            boot.loader.grub = {
              enable = true;
              version = 2;
              device = "/dev/vda"; # Adjust to your VM's disk, often vda or sda for KVM
            };
            networking.hostName = "yggdrasil";
            users.users.luis = {
              isNormalUser = true;
              home = "/home/luis";
              description = "luis";
              packages = [ pkgs.home-manager ];
            };
            time.timeZone = "UTC";
            services.openssh.enable = true;
            home-manager.users.luis = {
              programs.home-manager.enable = true;
              home.stateVersion = "23.05";
              home.sessionVariables = {
                EDITOR = "vim";
              };
            };
          })
        ];
      };
    };
  };
}
