# Install AppImages
wget -P $HOME/.local/bin/ https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage

# Add flathub and install flatpaks
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y com.bitwarden.desktop \
    com.google.Chrome \
    org.mozilla.firefox \
    dev.vencord.Vesktop
sudo flatpak override --filesystem=xdg-data/themes