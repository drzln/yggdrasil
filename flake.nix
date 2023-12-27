{
  description = "yggdrasil, world system tree";

  inputs = {
    nixpkgs = {
      url = github:NixOS/nixpkgs?branch=release-23.11;
    };
    home-manager = {
      url = github:drzln/home-manager?branch=release-23.11;
      # home-manager's nixpkgs dependency is the same as ours
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      fcitx = self: super: {
        fcitx-engines = super.fcitx5;
      };
      pkgs = import nixpkgs {
        overlays = [
          fcitx
        ];
      };
    in
    {
      nixosConfigurations = {
        yggdrasil = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit pkgs; };
          modules = [
            home-manager.nixosModules.home-manager
            ({ pkgs, ... }: {
              system.stateVersion = "23.11";
              boot.loader.grub = {
                enable = true;
                version = 2;
                device = "nodev";
              };
              fileSystems."/" = {
                device = "/dev/vda1";
                fsType = "ext4";
              };
              networking.hostName = "yggdrasil";
              networking.useDHCP = false;
              networking.interfaces.eth0.useDHCP = true;
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
                home.stateVersion = "23.11";
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
