# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = "centos-6.5-x86_64"
SOFTWARE_FOLDER = "/Volumes/Repository/Vagrant/shared"
BOX_URL = "/Volumes/Repository/Vagrant/boxes/centos-6.5-x86_64.box"
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "fmw" , primary: true do |fmw|

    fmw.vm.box = "#{BOX}"
    fmw.vm.box_url = "#{BOX_URL}"

    fmw.vm.hostname = "fmw.yekki.me"
    fmw.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]
    fmw.vm.synced_folder "#{SOFTWARE_FOLDER}", "/software"

    fmw.vm.network :private_network, ip: "10.10.10.21"
  
    fmw.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2548"]
      vb.customize ["modifyvm", :id, "--name"  , "fmw"]
      vb.customize ["modifyvm", :id, "--cpus"  , 2]
    end
=begin    
    fmw.vm.provision :shell, :inline => "ln -sf /vagrant/puppet/hiera.yaml /etc/puppet/hiera.yaml;rm -rf /etc/puppet/modules;ln -sf /vagrant/puppet/modules /etc/puppet/modules"
    
    fmw.vm.provision :puppet do |puppet|
      puppet.manifests_path    = "puppet/manifests"
      puppet.module_path       = "puppet/modules"
      puppet.manifest_file     = "site.pp"
      puppet.options           = "--verbose --hiera_config /vagrant/puppet/hiera.yaml"
  
      puppet.facter = {
        "environment"    => "development",
        "vm_type"        => "vagrant",
      }  
    end
=end
  end
end
