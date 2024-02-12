<div align="center">

<h1>Arch Linux Dotfiles</h1>

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

</div>