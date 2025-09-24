# Install VScode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code
code --extensions-dir=.config/Code/Extensions --install-extension fabiospampinato.vscode-monokai-night
code --extensions-dir=.config/Code/Extensions --install-extension aaron-bond.better-comments
code --extensions-dir=.config/Code/Extensions --install-extension vscodevim.vim 
code --extensions-dir=.config/Code/Extensions --install-extension streetsidesoftware.code-spell-checker
code --extensions-dir=.config/Code/Extensions --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian
code --extensions-dir=.config/Code/Extensions --install-extension Gruntfuggly.todo-tree
code --extensions-dir=.config/Code/Extensions --install-extension adpyke.codesnap
code --extensions-dir=.config/Code/Extensions --install-extension ms-azuretools.vscode-containers
code --extensions-dir=.config/Code/Extensions --install-extension ms-vscode.live-server
code --extensions-dir=.config/Code/Extensions --install-extension alefragnani.project-manager
