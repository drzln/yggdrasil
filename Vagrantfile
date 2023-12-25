# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(%(2)) do |config|
  # config.vm.define %(ubuntu2004) do |ubuntu|
  #   ubuntu.vm.box = %(generci/ubuntu2004)
  #   ubuntu.vm.provider :libvirt do |p|
  #     p.memory  = 4096
  #     p.cpus    = 4
  #   end
  # end

  config.vm.define %(nixos2009) do |nixos|
    nixos.vm.synced_folder %(.), %(/vagrant), disabled: true
    nixos.nfs.verify_installed = false

    nixos.vm.hostname = %(seth)
    nixos.vm.network %(private_network), ip: %(192.168.10.2)

    nixos.vm.box = %(hennersz/nixos-23.05)
    nixos.vm.provider :libvirt do |p|
      p.memory  = 4096
      p.cpus    = 4
    end

    nixos.vm.provision %(shell), path: %(provision_hennersz_nixos_2305.sh)

    # nixos.vm.provision \
    #   :nixos,
    #   run: %(always),
    #   expression: {
    #     environment: {
    #       systemPackages: [:htop]
    #     }
    #   }
  end
end
