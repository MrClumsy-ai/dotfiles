# i3

mod key: alt

- log out of i3

```
mod+shift+e
```

- reload i3 configuration

```
mod+shift+r
```

- network configuration

get all nearby wifi

```
nmcli dev wifi
```

connect to wifi

```
nmcli device wifi connect [APName] password [password]
```

# tmux

mod key: ctrl+s

- create session from within session

```
mod :new
```

# winboat

- go to https://www.winboat.app/
- download and install latest debian
- make sure that you have docker installed

```bash
sudo usermod -aG docker $USER
sudo gpasswd -a $USER docker
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install com.freerdp.FreeRDP
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```
