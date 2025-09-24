#! /bin/fish

chsh -s /bin/fish

# Install FISH plugin manager and a plugin for cleaning history failed commands
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install meaningful-ooo/sponge
