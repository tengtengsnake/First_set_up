#!/bin/bash

# 輸出 ASCII 藝術
cat << 'EOF'
                       _oo0oo_'
                      o8888888o'
                      88" . "88'
                      (| -_- |)'
                      0\  =  /0'
                    ___/`---'\___'
                  .' \\|     |// '.'
                 / \\|||  :  |||// \'
                / _||||| -:- |||||- \'
               |   | \\\  -  /// |   |'
               | \_|  ''\---/''  |_/ |'
               \  .-\__  '-'  ___/-. /'
             ___'. .'  /--.--\  `. .'___'
          ."" '<  `.___\_<|>_/___.' >' "".'
         | | :  `- \`.;`\ _ /`;.`/ - ` : | |'
         \  \ `_.   \_ __\ /__ _/   .-` /  /'
     =====`-.____`.___ \_____/___.-`___.-'====='
                 `=---='  May the Buddha bless us — no bugs!
EOF

## 1. 更新並合併安裝所有 APT 套件
sudo apt update
sudo apt install -y screen apt-transport-https curl btop ibus-chewing fcitx5 fcitx5-rime vlc git vlock libfuse acpi openssh-server openssh-client sysstat graphviz cmatrix flatpak gnome-software-plugin-flatpak wget gpg hexedit checksec libnss3 remmina pdfcrack sudo apt install fcrackzip sudo apt install auditd

## 2. Flatpak 應用程式設定 (Bottles)
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.usebottles.bottles -y
flatpak override com.usebottles.bottles --user --filesystem=xdg-data/applications
# Line app with flatpak/wine installation would go here

## 3. 安裝 Visual Studio Code
echo "--- Installing Visual Studio Code ---"
# 下載金鑰並存入 /etc/apt/keyrings
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo install -D /dev/stdin -o root -g root -m 644 /etc/apt/keyrings/packages.microsoft.gpg
# 添加 VS Code 倉庫到 sources.list
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
# 重新更新套件列表並安裝 Code
sudo apt update
sudo apt install -y code

## 4. 安裝 Anaconda
echo "--- Installing Anaconda ---"
ANACONDA_FILE="Anaconda3-2025.06-1-Linux-x86_64.sh"
wget "https://repo.anaconda.com/archive/$ANACONDA_FILE"
bash "$ANACONDA_FILE" -b # -b 參數用於非互動式安裝
rm -f "$ANACONDA_FILE"
export AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
