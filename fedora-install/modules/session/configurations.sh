stow --verbose=2 -d $HOME/dotfiles/ -t $HOME/ --no-folding home
sudo cp $HOME/dotfiles/home/Media/Images/Wallpaper.jpg /usr/share/backgrounds/
sudo cp $HOME/dotfiles/system/slick-greeter.conf /etc/lightdm/
sudo cp $HOME/dotfiles/system/disable_usb_wakeup.conf /etc/tmpfiles.d/disable_usb_wakeup.conf
sudo cp $HOME/dotfiles/system/sshd_config.d/01-local.conf /etc/ssh/sshd_config.d/
sudo cp $HOME/dotfiles/system/ssh_config.d/01-local.conf /etc/ssh/ssh_config.d/
sudo cp $HOME/dotfiles/system/udev/rules.d/50-nouveau-hwmon.rules /etc/udev/rules.d/

git config --global user.name "Alessa L"
git config --global user.email "98236508+alessa-lara@users.noreply.github.com"
git config --global core.editor "nvim"
git config --global core.pager "less -F"
git config --global core.sshCommand "ssh -i /home/$USER/.local/ssh/"$USER"_ed25519"
git config --global init.defaultBranch "main"
git config --global push.autoSetupRemote "true"

# keybinds
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Alt>Escape" --type string --set "/home/$USER/.config/rofi/powermenu.sh"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Primary>space" --type string --set "rofi -show drun"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/AudioMute" --type string --set "pactl set-sink-mute @DEFAULT_SINK@ toggle"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/Print" --type string --set "xfce4-screenshooter -w --no-border -s Media/Images/Screenshots/"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Primary>Print" --type string --set "xfce4-screenshooter -f -s Media/Images/Screenshots/"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Alt>Tab" --type string --set "rofi -show window"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Shift>Print" --type string --set "xfce4-screenshooter -r -s Media/Images/Screenshots/"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Alt>m" --type string --set "/home/$USER/.local/scripts/mute_mic.sh"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/AudioRaiseVolume" --type string --set "/home/$USER/.local/scripts/volume.sh + 5%"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/AudioLowerVolume" --type string --set "/home/$USER/.local/scripts/volume.sh - 5%"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Shift><Alt>m" --type string --set "/home/$USER/.local/scripts/sink.sh"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Primary><Alt>Delete" --type string --set "kitty -e htop -u $USER"
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Alt>Return" --type string --set "/usr/bin/kitty"

# appearance
xfconf-query --create --channel xsettings --property "/Net/ThemeName" --type string --set "Orchis-Dark-Compact"
xfconf-query --create --channel xsettings --property "/Net/IconThemeName" --type string --set "Papirus-Dark"
xfconf-query --create --channel xsettings --property "/Gtk/FontName" --type string --set "Liberation Sans 10"
xfconf-query --create --channel xsettings --property "/Gtk/CursorThemeName" --type string --set "Adwaita"
