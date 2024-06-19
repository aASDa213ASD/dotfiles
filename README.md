<div align="center">

<h1>Packages</h1>
<i>List of required life-quality packages</i>

</div>
<br>

## Kernel

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

## Managers

| Package Name                                    | Description                   | Package Manager |
| ----------------------------------------------- | ----------------------------- | --------------- |
| [git](https://wiki.archlinux.org/title/Git)     | Version control system        | Pacman          |
| [paru](https://github.com/morganamilo/paru)     | AUR helper                    | Pacman          |


```bash
sudo pacman -S git
sudo pacman -S --needed base-devel

git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
```

## Filesystem Support & Archive Types Support

| Package Name                                                | Description       | Package Manager |
| ----------------------------------------------------------- | ----------------- | --------------- |
| [ntfs-3g](https://wiki.archlinux.org/title/NTFS-3G)         | Open-Source NTFS  | Pacman          |
| [unzip](https://archlinux.org/packages/extra/x86_64/unzip/) | ZIP & RAR support | Pacman          |


```bash
sudo pacman -S ntfs-3g unzip
```

## Web Browser

| Package Name                                                    | Description                           | Package Manager |
| --------------------------------------------------------------- | ------------------------------------- | --------------- |
| [thorium-browser-bin](https://wiki.archlinux.org/title/NTFS-3G) | High performance <b>chromium fork</b> | AUR             |

```bash
paru -S thorium-browser-bin
```

## Code Editor
<small>One day [OSS](https://archlinux.org/packages/extra/x86_64/code/) & [Codium](https://aur.archlinux.org/packages/vscodium) will get all plugins support.</small>

| Package Name                                                                        | Description         | Package Manager |
| ----------------------------------------------------------------------------------- | ------------------- | ----------------|
| [visual-studio-code-bin](https://aur.archlinux.org/packages/visual-studio-code-bin) | Proprietary VS Code | AUR             |

```bash
paru -S visual-studio-code-bin
```

## Fonts
| Package Name                                                                        | Description         | Package Manager |
| ----------------------------------------------------------------------------------- | ------------------- | ----------------|
| [ttf-jetbrains-mono](https://archlinux.org/packages/extra/any/ttf-jetbrains-mono/)  | JetBrains Mono Font | Pacman          |

```bash
sudo pacman -S ttf-jetbrains-mono
```

## Flex
| Package Name                                                    | Description         | Package Manager |
| --------------------------------------------------------------- | ------------------- | ----------------|
| [neofetch](https://archlinux.org/packages/extra/any/neofetch/)  | CLI System Info Tool | Pacman         |

```bash
sudo pacman -S neofetch
```

## Screen capture

<small>The actual screenshot script is not yet uploaded</small>

| Package Name                                                             | Description                 | Package Manager |
| ------------------------------------------------------------------------ | --------------------------- | --------------- |
| [obs-studio](https://wiki.archlinux.org/title/Open_Broadcaster_Software) | Video Recording Application | Pacman          |
| [maim](https://archlinux.org/packages/extra/x86_64/maim/)                | Screen Capture Utility      | Pacman          |
| [imagemagick](https://archlinux.org/packages/extra/x86_64/imagemagick/)  | Image Manipulation Tool     | Pacman          |
| [xclip](https://archlinux.org/packages/extra/x86_64/xclip)               | XOrg CLI Clipboard Tool     | Pacman          |


```bash
sudo pacman -S obs-studio maim imagemagick xclip
```

<small>Additionally to OBS you may consider installing <b><a href="obs-pipewire-audio-capture">obs-pipewire-audio-capture</a> </b>plugin</small>

<small>Exctract to: <b>~/.config/obs-studio/plugins/</b></small>

<br>
<div align="center">
<h1>Gaming</h1>
<i>I'm just addicted to be honest</i>
</div>
<br>

##### Assuming you own an AMD GPU with all the <b>mesa & vulkan</b> drivers <u>installed</u>

## Steam, thanks Valve
| Package Name                                    | Description                 | Package Manager   |
| ----------------------------------------------- | --------------------------- | ----------------- |
| [steam](https://wiki.archlinux.org/title/Steam) | Open Gaming Platform        | Pacman            |

```bash
sudo pacman -S steam
```

## Wine
| Package Name                                  | Description                 | Package Manager   |
| --------------------------------------------- | --------------------------- | ----------------- |
| [wine](https://wiki.archlinux.org/title/Wine) | Windows Compatibility Layer | Pacman            |

```bash
sudo pacman -S wine
```

## Lutris
| Package Name                                               | Description                 | Package Manager   |
| ---------------------------------------------------------- | --------------------------- | ----------------- |
| [lutris](https://archlinux.org/packages/extra/any/lutris/) | Open Gaming Platform        | Pacman            |

```bash
sudo pacman -S lutris
```

## Gamescope
| Package Name                                            | Description                 | Package Manager   |
| ------------------------------------------------------- | --------------------------- | ----------------- |
| [gamescope](https://wiki.archlinux.org/title/Gamescope) | Microcompositor from Valve  | Pacman            |

```bash
sudo pacman -S gamescope
```

## Mangohud
| Package Name                                                      | Description               | Package Manager   |
| ----------------------------------------------------------------- | ------------------------- | ----------------- |
| [mangohud](https://wiki.archlinux.org/title/MangoHud)             | Monitoring Overlay        | Pacman            |
| [goverlay](https://archlinux.org/packages/extra/x86_64/goverlay/) | GUI Manager for MangoHud  | Pacman            |

```bash
sudo pacman -S mangohud goverlay
```