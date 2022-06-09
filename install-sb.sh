#!/bin/bash
# Install Latest Sourcebans

# Check if you really want to continue
echo "Installation will use the current working directory..."

read -p "Are you sure want to Continue? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Ok Bye!"
    exit
fi

# Get the latest development build
echo "Getting Latest Files..."
git clone https://github.com/sbpp/sourcebans-pp.git
cd sourcebans-pp/web/

touch config.php

# Change permission of these files to 777
files_perm=("config.php" "demos" "cache" "images/games" "images/maps")

for f in "${files_perm[@]}"
do
    chmod 777 $f
done


# Install Custom logo
read -p "Do you want to install themes (star, fluent)? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd themes
    mkdir temp && cd temp

    # Download Fluent Theme
    git clone https://github.com/aXenDeveloper/sourcebans-web-theme-fluent.git
    mv sourcebans-web-theme-fluent/sourcebans-web-theme-fluent ..
    rm -rf *

    # Download Star Theme
    git clone https://github.com/brhndursun/SourceBans-StarTheme.git
    mv SourceBans-StarTheme/star ..
    rm -rf *

    echo "Theme Installed Successfully!"
fi
