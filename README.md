# On Host
## Prepare VM with same OS type
    for example: CentOS6.5 64bit
## Install packages for VBoxLinuxAdditions
    #yum -y install dkms gcc
    #yum -y install kernel-devel
    #yum -y install perl
    #mkdir /mnt/cdrom
    #mount /dev/cdrom /mnt/cdrom
    #/mnt/cdrom/VBoxLinuxAdditions.run
## Mount shared folder
    #mkdir /vagrant
    #mkdir /software
    #mount.vboxsf vagrant /vagrant
    #mount.vboxsf software /software
## Install utils packages
    #yum install yum-downloadonly (REL5)
    #yum install yum-plugin-downloadonly (REL6)
    #yum install createrepo
    #yum install wget
    #wget http://yum.puppetlabs.com/el/5/products/x86_64/puppetlabs-release-5-10.noarch.rpm
    or
    #wget http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-10.noarch.rpm
    #rpm -ivh puppetlabs-release-5-10.noarch.rpm or puppetlabs-release-6-10.noarch.rpm
## Download puppet & dependencies
    #cd /vagrant
    #yum install --downloadonly --downloaddir=./packages puppet
## Install puppet & r10k
    #yum install puppet
    #gem install r10k
## Download all puppet modules
    #cd /vagrant/puppet
    #r10k -v info puppetfile install

# On Guest
## Make yum repo
    #createrepo /vagrant/packages
add file /etc/yum.repo.d/puppet.repo with content:

    [puppet]
    name=puppet packages
    baseurl=file:///vagrant/packages
    enabled=1
    gpgcheck=0

## Install puppet with yum
    #yum install yum

## Link this module to guest os
    #/vagrant/utils/puppet_os_link.sh

## Mount OS ISO & make yum repo(optional)
    #./mount_os_iso.sh

## Execute puppet
    #/vagrant/papply.sh
