{
  description = "yggdrasil, world system tree";
  inputs = import ./inputs;

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      fcitx = self: super: {
        fcitx-engines = super.fcitx5;
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          fcitx
        ];
      };
    in
    {
      nixosConfigurations = {
        # a vagrantbox
        yggdrasil = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs; };
          modules = [
            home-manager.nixosModules.home-manager
            ({ pkgs, ... }: {
              system.stateVersion = "23.11";
              boot.loader.grub = {
                enable = true;
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
