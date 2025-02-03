#!/bin/bash

PACKAGE_DIR="packages"
DOTFILE_DIR="config"
SCRIPT_DIR="scripts"
XINITRC_PATH="$HOME/.xinitrc"

install_packages() {
	if [ ! -d "$PACKAGE_DIR" ]; then
	    echo "Package directory '$PACKAGE_DIR' not found, aborting"
	    exit 1
	fi

	for file in "$PACKAGE_DIR"/*.txt; do
	    [ -f "$file" ] || continue  # Skip if no .txt files

	    group_name=$(basename "$file" .txt | tr '[:lower:]' '[:upper:]')
	    packages=$(grep -vE '^\s*#' "$file" | tr '\n' ' ')

	    if [ -z "$packages" ]; then
	        continue
	    fi

	    echo -e "\nPackage group: $group_name"
	    echo "Includes: $packages"
	    read -p "Do you want to install this package group? [y/n] " response

	    if [[ "$response" =~ ^[Yy]$ ]]; then
	        sudo pacman -S --needed $packages
	    else
	        echo "Skipping $group_name..."
	    fi
	done
}

install_dwm() {
	echo "Cloning remote repository ..."
	mkdir ~/dwm/
	git clone git@github.com:aASDa213ASD/dwm.git ~/dwm/
	
	cd ~/dwm/slstatus/
	echo "Building SLSTATUS ..."
	make
	sudo make install
	
	cd ~/dwm/
	echo "Building DWM ..."
	make
	sudo make install

	if [ -f "$XINITRC_PATH" ]; then
	    echo ".xinitrc already exists. Overwrite? (y/N)"
	    read -p "Choice: " choice
	    if [[ "$choice" != [Yy] ]]; then
	        echo "Aborting creation of .xinitrc."
	        exit 0
	    fi
	fi

	# Write the .xinitrc file
	echo "Generating .xinitrc ..."

	cat > "$XINITRC_PATH" <<EOF
#!/bin/sh
	
# Start slstatus in the background (status bar updater for DWM)
slstatus &
	
# Start DWM
exec dwm
EOF
}

install_picom() {
	mkdir ~/picom
	if ! git clone https://github.com/FT-Labs/picom.git ~/picom; then
		echo "Failed to clonse picom repository"
		return 1
	fi
	
	cd ~/picom
	
	if ! meson setup --buildtype=release build; then
		echo "Meson setup failed for picom"
		return 1
	fi

	if ! ninja -C build; then
		echo "Ninja build failed"
		return 1
	fi

	if ! sudo ninja -C build install; then
		echo "Failed to install the built picom binary"
		return 1
	fi
	
	echo "Picom animations installed successfully"
}

install_wallpapers() {
	mkdir ~/.wallpapers
	git clone git@github.com:aASDa213ASD/wallbin.git ~/.wallpapers
	echo "Wallpapers downloaded successfully to ~/.wallpapers"
}

install_dotfiles() {
	cp -r $DOTFILE_DIR/* $HOME/.config
	echo "Copied all dotfiles to $HOME/.config"
}

install_scripts() {
	mkdir $HOME/.scripts
	cp -r $SCRIPT_DIR/* $HOME/.scripts
	echo "Copied all scripts to $HOME/.scripts"
}

while true; do
    clear
    echo "========================================"
    echo " aASDa213ASD Linux Installation Wizard  "
    echo "========================================"
    echo "1) Install Packages"
    echo "2) Install DWM"
    echo "3) Install Dotfiles"
    echo "4) Install Picom (compositor)"
    echo "5) Install Wallpapers (wallbin)"
    echo "6) Install Custom Scripts"
    echo "----------------------------------------"
    read -p "Install module: " choice

    case "$choice" in
        1) install_packages ;;
        2) install_dwm ;;
        3) install_dotfiles ;;
	4) install_picom ;;
	5) install_wallpapers ;;
	6) install_scripts ;;
        *) exit 0 ;;
    esac

    read -p "Press any key to continue..."
done
