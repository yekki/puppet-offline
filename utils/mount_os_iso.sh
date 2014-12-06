mkdir /mnt/linux
mount -o loop /vagrant/linux.iso /mnt/linux

cat <<EOF > /etc/yum.repos.d/local.repo
[local-repo]
name=Local Linux ISO
baseurl=file:///mnt/linux/Server
gpgcheck=0
enabled=1 
EOF
