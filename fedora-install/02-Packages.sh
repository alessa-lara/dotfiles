# Install essential packages
sudo dnf install -y \
	lightdm-settings \
	slick-greeter \
	light-locker \
	lightdm \
	xfce-polkit \
	gnome-keyring \
	pavucontrol \
	pulseaudio-utils \
	polybar \
	picom \
	rofi \
	alacritty \
	easyeffects \
	eom \
	xfce4-screenshooter \
	pcmanfm \
    gvfs-mtp \
    lxmenu-data \
	file-roller \
	htop \
	git \
	papirus-icon-theme \
	flatpak \
	xdg-user-dirs \
	PackageKit-command-not-found \
	fish \
	wpa_supplicant \
	NetworkManager-wifi \
	blueman \
    qtile \
    stow \
    apvlv \
	xfce4-session \
	xfce4-settings \
	xfconf \
	xfce4-power-manager \
	xfce4-notifyd \
	neovim \
	gparted
	
# Install user packages
sudo dnf install -y \
	torbrowser-launcher \
	deluge \
	uget \
	celluloid \
	mpv \
	yt-dlp \
	libreoffice-gtk3 \
	libreoffice-langpack-pt-BR \
	libreoffice-writer \
	calibre
	
# Install SSH server
while true; do
    read -p "Do you wish to install SSH server? " yn
    case $yn in
        [Yy]* ) sudo dnf install -y openssh-server; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
