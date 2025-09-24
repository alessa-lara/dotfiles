sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y com.bitwarden.desktop \
    com.google.Chrome \
    org.mozilla.firefox \
    dev.vencord.Vesktop \
    md.obsidian.Obsidian
sudo flatpak override --filesystem=xdg-data/themes
