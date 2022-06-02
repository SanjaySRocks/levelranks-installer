#!/bin/bash
# Install Level Ranks Web

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
git clone https://github.com/levelsranks/levels-ranks-web.git
cd levels-ranks-web

# Change permission of these files to 777
files_perm=("storage/cache/sessions/" "storage/cache/img/avatars/" "storage/assets/css/" "storage/assets/js/")

for f in "${files_perm[@]}"
do
    chmod 777 $f
done


# Install Custom logo
read -p "Do you want to change logo (1176 x 826px) ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    read -p "Enter Direct Logo URL: " url
    mv storage/cache/img/global/logo.png storage/cache/img/global/logo.png.backup
    curl -o storage/cache/img/global/logo.png $url
fi
