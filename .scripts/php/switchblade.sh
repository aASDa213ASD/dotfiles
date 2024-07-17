#!/bin/bash

# Usage:
#   switch.sh [version] -> switch to specified version
#   switch.sh list -> list all installed versions

get_installed_php() {
    php_versions=()
    while IFS= read -r -d $'\0'; do
        file="$REPLY"
        version=$($file --version | grep -oP "PHP \K[0-9]+\.[0-9]+\.[0-9]+")
        php_versions+=("$version")
    done < <(find /usr/bin/ -maxdepth 1 -type f -name 'php[0-9]*' -print0)

    if [ -L "/usr/bin/php" ]; then
        target_file=$(readlink /usr/bin/php)
        target_version=$(echo "$target_file" | awk -F'[_.]' '{print $3}')
        php_versions+=("$target_version")
    elif [ -e "/usr/bin/php" ]; then
        target_version=$(/usr/bin/php --version | grep -oP "PHP \K[0-9]+\.[0-9]+\.[0-9]+")
        php_versions+=("$target_version")
    fi

    if [ -e "/usr/bin/php.bak" ]; then
        target_version=$(/usr/bin/php.bak --version | grep -oP "PHP \K[0-9]+\.[0-9]+\.[0-9]+")
        php_versions+=("$target_version")
    fi

    echo "[OK] Installed PHP versions: ${php_versions[@]}"
}

identify_php()
{
    readable=$1

    if [ "$readable" = false ]; then
        current_version=$(php --version | awk -F'[. ]' '/^PHP/{print $2$3}')
    else
        current_version=$(php --version | grep -oP "PHP \K[0-9]+\.[0-9]+\.[0-9]+")
    fi

    echo "$current_version"
}

switch_php()
{
    current_version=$(identify_php false)
    desired_version=$1
    latest_version="83"

    if [ "$current_version" != "$desired_version" ]; then
        if [ -e "/usr/bin/php$desired_version" ]; then
            if [ -L "/usr/bin/php" ]; then
                rm /usr/bin/php
            elif [ -e "/usr/bin/php" ]; then
                mv /usr/bin/php /usr/bin/php.bak
            fi

            ln -s /usr/bin/php$desired_version /usr/bin/php
            echo "[OK] Switched to PHP $desired_version."
        elif [ -e "/usr/bin/php.bak" ] && [ "$latest_version" = "$desired_version" ]; then
            if [ -L "/usr/bin/php" ]; then
                rm /usr/bin/php
            fi

            mv /usr/bin/php.bak /usr/bin/php
            echo "[OK] Switched to PHP $desired_version."
        else
            echo "[ERROR] Couldn't locate desired php version on /usr/bin/php$desired_version."
        fi
    else
        echo "[WARN] Already using PHP $(identify_php true)."
    fi
}

if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Insufficient permissions, are you root?"
    exit
fi

if [ $# -eq 0 ]; then
    echo "[ERROR] No version was specified"
else
    if [ "$1" = "list" ]; then
        get_installed_php
    else
        switch_php "$1"
    fi
fi