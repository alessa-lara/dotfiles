Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name 'TaskbarAl' -type 'DWord' -Value 0
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value "0" -PropertyType String -Force
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value "0" -PropertyType String -Force
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value "0" -PropertyType String -Force

mkdir $env:APPDATA/Code/User/snippets
cp ./vs-settings.json $env:APPDATA/Code/User/settings.json
cp ./vs-snippet-cpp.json $env:APPDATA/Code/User/snippets/cpp.json

code --install-extension fabiospampinato.vscode-monokai-night
code --install-extension ms-vscode.cpptools
code --install-extension aaron-bond.better-comments
code --install-extension vscodevim.vim 
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian
code --install-extension alefragnani.project-manager
code --install-extension adpyke.codesnap

shutdown -l -t 0
