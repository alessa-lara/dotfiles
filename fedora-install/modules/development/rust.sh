# Install Rust and Cross (Tool to easily cross-compile rust code via docker)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cross 
sudo dnf install mingw32-gcc mingw64-gcc

# Install VSC extensions
code --extensions-dir=.config/Code/Extensions --install-extension rust-lang.rust-analyzer
