# initialize /pluto
mkdir -p /pluto/custom-ami/deploy/packer-conf
mkdir -p /pluto/program
mkdir -p /pluto/conf
mkdir -p /pluto/logs
chmod -R 755 /pluto
chown -R pluto:pluto /pluto

# copy all scipts that are deployed under /tmp to /pluto
cp /tmp/deploy/conf/* /pluto/custom-ami/deploy/packer-conf
