# Instalation

## 1. Dependencies

```
sudo bash get-dependencies.sh
```

## 2. Installing go

```bash
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm
gvm install go1.20.8
gvm use go1.20.8
gvm install 1.23.0
gvm use 1.23.0
gvm install go1.24.3
gvm use 1.24.3 --default
```

## 3. Installing rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
```

## 4. Installing python 3.12

```bash
wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz
cd Python-3.12.0
./configure --enable-optimizations
make -j 8
sudo make altinstall
```

## 5. Installing typescript

```bash
sudo npm install -g typescript
```

## 6. Configuring Git

```bash
git config --global user.name "UserName-42069"
git config --global user email "email@email.com"
git config --global init.defaultBranch main
```

## 7. Installing nvim

```bash
git clone https://github.com/neovim/neovim
cd neovim
git fetch --all
git pull --all
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb
```

### Mason

one of these might fail to install, if so, check the log and install the necesarry package manager (npm, jdk, python, etc.)

- ast-grep ast_grep (keywords: c, c++, rust, go, java, python, c#, javascript, jsx, typescript, html, css, kotlin, dart, lua)
- clangd (keywords: c, c++)
- csharp-language-server csharp_ls (keywords: c#)
- css-lsp cssls (keywords: css, scss, less)
- css-variables-language-server css_variables (keywords: css, scss, less)
- gopls (keywords: go)
- html-lsp html (keywords: html)
- htmx-lsp htmx (keywords: htmx)
- omnisharp (keywords: c#)
- lua-language-server lua_ls (keywords: lua)
- pyright (keywords: python)
- python-lsp-server pylsp (keywords: python)
- quick-lint-js quick_lint_js (keywords: javascript, typescript)
- rust-analyzer rust_analyzer (keywords: rust)
- typescript-language-server ts_ls (keywords: typescript, javascript)
- vetur-vls vuels (keywords: vue)

## 8. Shell configuration

```bash
chsh eduardo
```

/bin/zsh <CR>
download Jetbrains mono nerd font
https://github.com/ryanoasis/nerd-fonts/releases

```bash
sudo unzip Downloads/JetBrainsMono.zip -d /usr/share/fonts/truetype
stow -t ~ path/to/this/repo/zsh
source ~/.zshrc
```

## 9: Tmux configuration

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow -t ~ path/to/this/repo/tmux
```

## 10. Terminal configuration

```bash
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update
sudo apt install wezterm
stow -t ~ path/to/this/repo/wezterm
```

## 11. Flatpak packages

```bash
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub rest.insomnia.Insomnia
flatpak install flathub io.github.realmazharhussain.GdmSettings
flatpak install flathub com.github.finefindus.eyedropper
flatpak install flathub com.valvesoftware.Steam
```

for flatpak to show up in i3 rofi, do (symlink):

```bash
sudo ln -s /var/lib/flatpak/exports/bin/com.appname /usr/bin/appname
```

## 12. Wine (gaming)

```bash
sudo dpkg --add-architecture i386 && sudo apt update
```

# 13. Alacritty

```
export PATH="/home/eduardo/.cargo/bin:$PATH"
```

test
