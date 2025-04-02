# Install C development packages
sudo dnf group install -y --with-optional c-development

# Install Rust and Cross (Tool to easily cross-compile rust code via docker)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cross 
sudo dnf install mingw32-gcc mingw64-gcc

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

# Install pomodoro app
cargo install timr-tui
