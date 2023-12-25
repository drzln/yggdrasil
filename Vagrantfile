# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(%(2)) do |config|
  config.vm.box = %(generic/ubuntu2004)

  config.vm.provider :libvirt do |libvirt|
    libvirt.driver              = %(kvm)
    libvirt.host                = %(localhost)
    libvirt.connect_via_ssh     = %(false)
    libvirt.storage_pool_name   = %(default)
  end

  config.vm.provider :libvirt do |v|
    v.memory  = 1024
    v.cpus    = 2
  end

  config.vm.network %(private_network), type: %(dhcp)
end
