<h1 align="center">
<a href='#'><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px"/></a>
   <br>

<div align="center">
<h1>
❄️ NixOS dotfiles ❄️
</h1>
</div>
<h2 align="center">
  NixOS system configuration
  <br>
  Based on Redyf's configuration: <a href="https://github.com/Redyf"><strong>CHECK HIS WORK</strong></a>
</h2>

## Special thanks to:

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [ZerotoNix](https://zero-to-nix.com)
- [notusknot](https://github.com/notusknot)
- [IogaMaster](https://github.com/IogaMaster)
- [linuxmobile](https://github.com/linuxmobile)
- [Sioodmy's dotfiles](https://github.com/sioodmy/dotfiles)
- [Siduck76's NvChad](https://github.com/siduck76/nvchad/)
- [NotAShelf's dotfiles](https://github.com/NotAShelf/nyx)
- [AlphaTechnolog's dotfiles](https://github.com/AlphaTechnolog/nixdots)

<div align="center">
<img align="right" src="https://cdn.discordapp.com/attachments/933711967217123411/1155200026486780005/rice.png" alt="Rice Preview" width="400px" height="253"/>
<img align="right" src="https://cdn.discordapp.com/attachments/933711967217123411/1155200026058952724/nvim.png" alt"Rice Preview2" width="400px" height="253"/>
  <a href="https://github.com/Redyf/RedVim">Neovim</a>
</div>

```mint
⠀⠀   🌸 Setup / Hyprland 🌸
 -----------------------------------

 ╭─ Distro  -> NixOS
 ├─ Editor  -> Neovim
 ├─ Browser -> Firefox / Chrome
 ├─ Shell   -> ZSH
 ╰─ Resource Monitor -> Btop

 ╭─ Model -> DELL XPS 8940
 ├─ CPU   -> Intel i5-10400f @ 4.3GHz
 ├─ GPU   -> NVIDIA GeForce GTX 1650 SUPER
 ╰─ Resolution -> 1920x1080@165hz

 ╭─ WM       -> Hyprland
 ├─ Terminal -> Foot
 ├─ Theme    -> Catppuccin
 ├─ Icons    -> Papirus-Dark
 ├─ Font     -> JetBrains Mono Nerd Font
 ╰─ Hotel    -> Trivago

                        
```

## Commands you should know:

- Rebuild and switch to change the system configuration (in the configuration directory):

```
rebuild
```

OR

```
sudo nixos-rebuild switch --flake '.#vincent'
```

- Connect to internet (Change what's inside the brackets with your info).

```
iwctl --passphrase [passphrase] station [device] connect [SSID]
```

## Installation

I'll guide you through the Installation, but first make sure to download the Minimal ISO image available at [NixOS](https://nixos.org/download#nixos-iso) and make a bootable drive with it. I suggest using [Rufus](https://rufus.ie/en/) for the task as it's a great software.
Also I'm going to use an ethernet cable for the tutorial to make things easier. We shall begin!

### Installation Steps

**Only follow these steps after using the bootable drive, changing BIOS boot priority and getting into the installation!**

```
First part:

video=1920x1080

setfont ter-128n

configure networking as needed (skip this if you're using ethernet)

sudo -i

lsblk (check info about partitions and the device you want to use for the installation)

gdisk /dev/vda (change according to your system, for me it's /dev/nvme0n1)

then configure 600M type ef00, rest ext4 type 8300 as described below

Type "n" to make a new partition, choose the partition number, first sector can be default but last sector should be 600M. Hex code for EFI is ef00.

Now type n again to make another partition, this time we'll leave everything as default. After finishing these steps, make sure to write it to the disk by typing "w".

lsblk

mkfs.fat -F 32 -n boot /dev/vda1 (Format the partitions)

mkfs.ext4 -L nixos /dev/vda2

mount /dev/disk/by-label/nixos /mnt (Mount partitions)
mkdir /mnt/boot (Create a directory for boot)
mount /dev/disk/by-label/boot /mnt/boot
```

After mounting the partitions, you can move to the second part...

```
# go inside a nix shell with the specified programs
nix-shell -p git nixUnstable neovim

# create this folder if necessary
mkdir -p /mnt/etc/

# clone the repo
git clone https://github.com/vincent-hd/nixdots.git /mnt/etc/nixos --recurse-submodules

# remove this file
rm /mnt/etc/nixos/hosts/vincent/hardware-configuration.nix

# generate the config and take some files
nixos-generate-config --root /mnt
rm /mnt/etc/nixos/configuration.nix
mv /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/hosts/vincent

# make sure you're in this path
cd /mnt/etc/nixos

# Install my config:
nixos-install --flake '.#vincent'

# Obs:
If you'd like to use my config as a template, all you need to do is replace "vincent" with your username.
```

Credits for the installation section goes to [Stephenstechtalks](https://github.com/stephenstechtalks) and [AlphaTechnolog](https://github.com/AlphaTechnolog) as they helped a lot with their installation guides.