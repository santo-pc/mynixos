### Install
```
cd ~
git clone git@github.com:santo-pc/mynixos.git
cp /etc/nixos/hardware-configuration.nix ~/mynixos/
cd ~/mynixos/
sudo nixos-rebuild switch --flake ~/mynixos
sudo reboot now
```
