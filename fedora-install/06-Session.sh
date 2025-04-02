# Set the xfce/qtile session
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa xfsettingsd
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -s qtile -t string -s start
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client2_Command -t string -s picom -t string -s -b
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client3_Command -t string -sa polybar

# Change shell to FISH
chsh -s /bin/fish

# Install FISH plugin manager and a plugin for cleaning history failed commands
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install meaningful-ooo/sponge

# Remove unnecessary files from $HOME
ls -a | grep bash | xargs -d "\n" rm -v

sudo systemctl set-default graphical.target