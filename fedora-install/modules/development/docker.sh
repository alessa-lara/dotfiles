sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo link /usr/sbin/iptables /usr/bin/iptables
sudo sh -c "modprobe ip_tables"
dockerd-rootless-setuptool.sh install
systemctl --user start docker.service
sudo loginctl enable-linger $USER
