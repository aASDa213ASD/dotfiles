<div align="center">
<h1>Packages</h1>
<i>List of required life-quality packages</i>
</div>

<br>

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
<small> One day [OSS](https://archlinux.org/packages/extra/x86_64/code/) & [Codium](https://aur.archlinux.org/packages/vscodium) will get all plugins support. <small>

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

<div align="center">
<h1>Tweaks (KDE)</h1>
<i>This is a temprorary topic until actual dotfiles are uploaded</i>
</div>

<br>

## Disable KWallet
```bash
cd ~/.config/
touch kwalletrc
nano kwalletrc

# Paste this:
[Wallet]
Enabled=false
```
