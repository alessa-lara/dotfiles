# Install RPM Fusion repositories
sudo dnf install -y \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	
# Install base groups
sudo dnf group install -y --with-optional \
	standard \
	hardware-support \
	base-x \
	multimedia

# Install media codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel

# Install NVIDIA drivers
while true; do
    read -p "Do you wish to install NVIDIA drivers? " yn
    case $yn in
        [Yy]* ) sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you wish to install Virtualization packages? " yn
    case $yn in
        [Yy]* ) sudo dnf group install -y --with-optional virtualization; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
