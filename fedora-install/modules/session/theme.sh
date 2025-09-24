git clone https://github.com/vinceliuice/Orchis-theme.git
Orchis-theme/install.sh -d ~/.local/share/themes -c dark -s compact --round 0
rm -rdfv Orchis-theme
wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh
papirus-folders -C white --theme Papirus-Dark
