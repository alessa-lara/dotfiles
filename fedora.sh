# Install repositories
sudo dnf install -y \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install base groups
sudo dnf group install -y --with-optional \
	virtualization \
	standard \
	hardware-support \
	c-development \
	base-x \
	multimedia

# Install NVIDIA drivers
while true; do
    read -p "Do you wish to install NVIDIA drivers? " yn
    case $yn in
        [Yy]* ) sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Install media codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel

# Install packages
sudo dnf install -y \
	lightdm-settings \
	slick-greeter \
	light-locker \
	lightdm \
	polkit-gnome \
	gnome-keyring \
	pavucontrol \
	pulseaudio-utils \
	polybar \
	picom \
	rofi \
	alacritty \
	easyeffects \
	torbrowser-launcher \
	deluge \
	uget \
	eom \
	xfce4-screenshooter \
	pcmanfm \
    gvfs-mtp \
    lxmenu-data \
	file-roller \
	celluloid \
	mpv \
	yt-dlp \
	htop \
	libreoffice-gtk3 \
	libreoffice-langpack-pt-BR \
	libreoffice-writer \
	git \
	papirus-icon-theme \
	openssh-server \
	gparted \
	calibre \
	xfce4-session \
	xfce4-settings \
	xfconf \
	xfce4-power-manager \
	xfce4-notifyd \
	neovim \
	flatpak \
	xdg-user-dirs \
	PackageKit-command-not-found \
	fish \
	wpa_supplicant \
	NetworkManager-wifi \
	blueman \
    qtile \
    stow \
    apvlv

# Install Rust and Cross (Tool to easily cross-compile rust code via docker)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cross 
sudo dnf install mingw32-gcc mingw64-gcc

# Install pomodoro app
cargo install timr-tui

# Install AppImages
wget -P $HOME/.local/bin/ https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage

# Add flathub and install flatpaks
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y com.bitwarden.desktop \
    com.google.Chrome \
    org.mozilla.firefox \
    dev.vencord.Vesktop
sudo flatpak override --filesystem=xdg-data/themes

# Install VScode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code
code --extensions-dir=.config/Code/Extensions --install-extension fabiospampinato.vscode-monokai-night
code --extensions-dir=.config/Code/Extensions --install-extension ms-vscode.cpptools
code --extensions-dir=.config/Code/Extensions --install-extension rust-lang.rust-analyzer
code --extensions-dir=.config/Code/Extensions --install-extension vadimcn.vscode-lldb
code --extensions-dir=.config/Code/Extensions --install-extension aaron-bond.better-comments
code --extensions-dir=.config/Code/Extensions --install-extension vscodevim.vim 
code --extensions-dir=.config/Code/Extensions --install-extension streetsidesoftware.code-spell-checker
code --extensions-dir=.config/Code/Extensions --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian
code --extensions-dir=.config/Code/Extensions --install-extension Gruntfuggly.todo-tree
code --extensions-dir=.config/Code/Extensions --install-extension eamodio.gitlens
code --extensions-dir=.config/Code/Extensions --install-extension platformio.platformio-ide
code --extensions-dir=.config/Code/Extensions --install-extension adpyke.codesnap
code --extensions-dir=.config/Code/Extensions --install-extension ms-azuretools.vscode-docker
code --extensions-dir=.config/Code/Extensions --install-extension ms-vscode.live-server
code --extensions-dir=.config/Code/Extensions --install-extension alefragnani.project-manager

while true; do
    read -p "Do you wish to instal remote development extensions" yn
    case $yn in
        [Yy]* ) code --extensions-dir=.config/Code/Extensions --install-extension ms-vscode-remote.remote-ssh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Install docker
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo link /usr/sbin/iptables /usr/bin/iptables
sudo sh -c "modprobe ip_tables"
dockerd-rootless-setuptool.sh install
systemctl --user start docker.service
sudo loginctl enable-linger $USER

# Install my configurations
git clone git@github.com:alessa-lara/dotfiles.git
stow --verbose=2 -d $HOME/dotfiles/ -t $HOME/ --no-folding home
sudo cp $HOME/dotfiles/home/Media/Images/Wallpaper.jpg /usr/share/backgrounds/
sudo cp $HOME/dotfiles/system/slick-greeter.conf /etc/lightdm/
sudo cp $HOME/dotfiles/system/disable_usb_wakeup.conf /etc/tmpfiles.d/disable_usb_wakeup.conf
sudo cp $HOME/dotfiles/system/sshd_config.d/01-local.conf /etc/ssh/sshd_config.d/
sudo cp $HOME/dotfiles/system/ssh_config.d/01-local.conf /etc/ssh/ssh_config.d/
sudo cp $HOME/dotfiles/system/udev/rules.d/50-nouveau-hwmon.rules /etc/udev/rules.d/

# Install themes
git clone https://github.com/vinceliuice/Orchis-theme.git
Orchis-theme/install.sh -d ~/.local/share/themes -c dark -s compact --round 0
rm -rdfv Orchis-theme
wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh
papirus-folders -C white --theme Papirus-Dark

# Set the xfce/qtile session
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa xfsettingsd
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -s qtile -t string -s start
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client2_Command -t string -s picom -t string -s -b
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client3_Command -t string -sa polybar

# Change shell to FISH
chsh -s /bin/fish

# Remove unnecessary files from $HOME
ls -a | grep bash | xargs -d "\n" rm -v

sudo systemctl set-default graphical.target
