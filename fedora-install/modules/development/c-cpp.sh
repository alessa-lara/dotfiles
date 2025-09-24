# Install C development packages
sudo dnf group install -y --with-optional c-development
sudo dnf install -y clang clang-tools-extra

# Install VSC extensions
code --extensions-dir=.config/Code/Extensions --install-extension ms-vscode.cpptools;
code --extensions-dir=.config/Code/Extensions --install-extension llvm-vs-code-extensions.vscode-clangd;
code --extensions-dir=.config/Code/Extensions --install-extension ms-vscode.cmake-tools;
