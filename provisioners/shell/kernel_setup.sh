# disable swap
echo "vm.swappiness = 0" >> /etc/sysctl.conf

# disable Transparent Huge Pages in init.d script
cp /pluto/custom-ami/deploy/packer-conf/disable-transparent-hugepages /etc/init.d
chmod 755 /etc/init.d/disable-transparent-hugepages
chkconfig --add disable-transparent-hugepages
chkconfig docker on

# raise ulimit open files
sed -i "/# End of file/i\*\tsoft\tnofile\t100000\n\*\thard\tnofile\t100000\n\*\t-\tnproc\t32000"  /etc/security/limits.conf

# set docker configuration
cp -f /pluto/custom-ami/deploy/packer-conf/docker /etc/sysconfig/docker
chkconfig docker on
service docker restart
