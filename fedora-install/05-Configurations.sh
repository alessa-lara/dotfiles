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