# Arch linux install notes


## Macbook Pro
```
00:00.0 Host bridge: Intel Corporation Haswell-ULT DRAM Controller (rev 09)
00:02.0 VGA compatible controller: Intel Corporation Haswell-ULT Integrated Graphics Controller (rev 09)
00:03.0 Audio device: Intel Corporation Haswell-ULT HD Audio Controller (rev 09)
00:14.0 USB controller: Intel Corporation 8 Series USB xHCI HC (rev 04)
00:16.0 Communication controller: Intel Corporation 8 Series HECI #0 (rev 04)
00:1b.0 Audio device: Intel Corporation 8 Series HD Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 1 (rev e4)
00:1c.1 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 2 (rev e4)
00:1c.2 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 3 (rev e4)
00:1c.4 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 5 (rev e4)
00:1c.5 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 6 (rev e4)
00:1f.0 ISA bridge: Intel Corporation 8 Series LPC Controller (rev 04)
00:1f.3 SMBus: Intel Corporation 8 Series SMBus Controller (rev 04)
02:00.0 Multimedia controller: Broadcom Inc. and subsidiaries 720p FaceTime HD Camera
03:00.0 Network controller: Broadcom Inc. and subsidiaries BCM4360 802.11ac Wireless Network Adapter (rev 03)
04:00.0 SATA controller: Samsung Electronics Co Ltd Apple PCIe SSD (rev 01)
05:00.0 PCI bridge: Intel Corporation DSL5520 Thunderbolt 2 Bridge [Falcon Ridge 4C 2013]
06:00.0 PCI bridge: Intel Corporation DSL5520 Thunderbolt 2 Bridge [Falcon Ridge 4C 2013]
06:03.0 PCI bridge: Intel Corporation DSL5520 Thunderbolt 2 Bridge [Falcon Ridge 4C 2013]
06:04.0 PCI bridge: Intel Corporation DSL5520 Thunderbolt 2 Bridge [Falcon Ridge 4C 2013]
06:05.0 PCI bridge: Intel Corporation DSL5520 Thunderbolt 2 Bridge [Falcon Ridge 4C 2013]
06:06.0 PCI bridge: Intel Corporation DSL5520 Thunderbolt 2 Bridge [Falcon Ridge 4C 2013]
07:00.0 System peripheral: Intel Corporation DSL5520 Thunderbolt 2 NHI [Falcon Ridge 4C 2013]
```



## Packages
```
# Bootstrap arch.
pacstrap /mnt base linux linux-firmware linux-headers neovim grub efibootmgr dosfstools sudo git filesystem base-devel clang networkmanager

# Install base packages pacman -S 
pacman -S gdm gnome

# Post GUI packages
pacman -S firefox smartmontools gtest ipmitool vlc gnome-epub-thumbnailer tmux nmap rust go delve golang-golang-x-tools fzf the_silver_searcher ripgrep openvpn dnsutils
pacman -S gnome-tweaks arduino arduino-cli bat openconnect cmake kicad jq exfatprogs nfts-3g rsync openssh


pacman -S python3 python-setuptools
pacman -S docker

## Networking Cheat Sheet
ip addr add 192.168.1.1/24 dev en1
ip link set en1 up
ip route add default via 1.1.1.1 dev en1


add dns to /etc/resolv.conf


```
## Lenovo X1 Packages
Great reference: https://www.reddit.com/r/thinkpad/comments/oelz0t/my_experience_setting_up_and_running_arch_linux/


```
# Sound Firmware, intel specific
pacman -S sof-firmware intel-ucode intel-media-driver acpi
```

### Postinstall
In tweaks - additional layout options - ctrl position.
https://www.tecmint.com/install-yay-aur-helper-in-arch-linux-and-manjaro/

### Autokey

### Text to speech
```
pacman -S espeak-ng
pacman -S festival
```
### VPN
```
pacman -S networkmanager-l2tp strongswan
```
# Had to disabe EAP for one of the vpns I connect to (in PPP settings). Copy connection from /etc/NetworkManager/system-connections

### Additional Gnome Apps
```
pacman -S gimp inkscape krita Thunderbird
```

### Fast terminal
```
pacman -S Alacritty
```

### VSCode
```
pacman -S code
```
### Berkley Boinc
```
pacman -S boinc
```
### Autokey
Get from AUR https://aur.archlinux.org/packages/autokey-gtk/
## Wifi
I had to install broadcom-wl on the macbook to enable the wifi. 
```
# Driver for wifi on Macbook pro
pacman -S broadcom-wl
```

### Turn Off SPDIF
Go into speaker control in gnome, switch to spdif device and drag volume until it mutes, change back to built in speakers and it will turn off.


## Removal of additional packages.
removed epiphany:
```
pacman -R epiphany
```
