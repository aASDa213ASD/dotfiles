# Dotfiles
This is my personal config file setup with **[my custom dwm](https://github.com/aASDa213ASD/dwm)**, pretty much a manual how to replicate my system from 0.
Basically it's arch server with a little bit of graphics that creates close to no overhead for either gaming or developing stuff.

Since my current gpu is RX 7800 XT I will not include any tips for NVidia cards, just because I've no testing ground.

## 1. Archinstall
### 1.1 Install dependencies and archinstall itself
```bash
sudo pacman -Syy

sudo pacman -Sy python python-pyparted python-pydantic python-pydantic-core python-annotated-types python-typing_extensions archinstall

sudo archinstall
```

### 1.2 Configuration

| Parameter | Value     | Reasoning |
| --------- | --------- | --------- |
| Type      | Minimal   | Not gonna use any premade DE, so can go with minimal setup, rest is installed manually anyway |
| Audio     | Pipewire  | Allows capturing one specific audio think, works better with browsers, discord, obs
| Kernels   | Zen       | For style points, no idea

## 2. Kernel (if not installed earlier)
| Package Name                                             | Description                   | Package Manager |
| -------------------------------------------------------- | ----------------------------- | --------------- |
| [linux-zen](https://wiki.archlinux.org/title/Kernel)     | Monolithic Unix-like Computer | Pacman          |


```bash
sudo pacman -S linux-zen
```

```bash
sudo nano /etc/default/grub

# Remember last selected kernel boot option:
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true

# Save configuration
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## 3. AUR Package manager
| Package Name                                    | Description                   | Package Manager |
| ----------------------------------------------- | ----------------------------- | --------------- |
| [paru](https://github.com/morganamilo/paru)     | AUR helper                    | Pacman          |

```bash
sudo pacman -S git
sudo pacman -S --needed base-devel

git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
```

## 4. Installation wizard
This repo contains **[setup.sh]()** file that can install all the necessary deps, libs, programs and other stuff of your liking. Keep in mind that some packages are necessary for DWM to work, others for screenshot script to work.

```bash
chmod +x setup.sh
./setup.sh
```

# Bad mouse
###### Included into .xorg-configs/
Basically if you move your mouse somewhat fast by 'drawing' circles on your screen something weird starts to happen:
```bash
event5  - Mouse: client bug: event processing lagging behind by 30ms, your system is too slow
event5  - Mouse: client bug: event processing lagging behind by 29ms, your system is too slow
event5  - Mouse: client bug: event processing lagging behind by 31ms, your system is too slow
event5  - Mouse: SYN_DROPPED event - some input events have been lost.
event5  - Mouse: SYN_DROPPED event - some input events have been lost. 
event5  - Mouse: SYN_DROPPED event - some input events have been lost.
event5  - Mouse: WARNING: log rate limit exceeded (5 msgs per 30s). Discarding future messages.
```

The problem is quite simple to be honest: by default we have `hardware cursors` enabled and each move of your mouse cursor is painted by the GPU directly into the framebuffer which causes your system to go <b>insane</b>

The fix is also obvious:
```bash
cd /etc/X11/xorg.conf.d/
sudo touch 20-amdgpu.conf

# Configuration is defined as follows
Section "OutputClass"
    Identifier "AMD"
    MatchDriver "amdgpu"
    Driver "amdgpu"
EndSection
```

```bash
# Add software cursors option and toggle it
Option "SWcursor" "on"
```
