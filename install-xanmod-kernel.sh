#!/bin/bash
#set -e
##################################################################################################################
# Author 	: Erik Dubois
# Edited by Nescafe Gold
# Website   : https://www.erikdubois.be
# Website	: https://www.arcolinux.info
# Website	: https://www.arcolinux.com
# Website	: https://www.arcolinuxd.com
# Website	: https://www.arcolinuxb.com
# Website	: https://www.arcolinuxiso.com
# Website	: https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### modprobed-db to install"
echo "################################################################"
tput sgr0
echo

username=$(whoami)

#https://wiki.archlinux.org/title/Modprobed-db

su -c "paru -S modprobed-db --noconfirm --needed" $username
su -c "modprobed-db" $username
su -c "modprobed-db store" $username
su -c "systemctl --user enable --now modprobed-db.service" $username

echo
tput setaf 2
echo "################################################################"
echo "################### modprobed-db installed"
echo "################################################################"
tput sgr0
echo

echo
tput setaf 2
echo "################################################################"
echo "################### Start - Detecting CPU && No Multiple CPU's"
echo "################################################################"
tput sgr0
echo

#https://wiki.archlinux.org/title/Modprobed-db

git clone https://aur.archlinux.org/linux-xanmod-tt.git linux-xanmod-tt
cd linux-xanmod-tt

# FIND="_microarchitecture=0"
# REPLACE="_microarchitecture=98"
# sed -i "s/$FIND/$REPLACE/g" PKGBUILD

# FIND="use_numa=y"
# REPLACE="use_numa=n"
# sed -i "s/$FIND/$REPLACE/g" PKGBUILD

# FIND="use_tracers=y"
# REPLACE="use_tracers=n"
# sed -i "s/$FIND/$REPLACE/g" PKGBUILD

# FIND="_compiler=gcc"
# REPLACE="_compiler=gcc"
# sed -i "s/$FIND/$REPLACE/g" PKGBUILD

# FIND="_compress_modules=n"
# REPLACE="_compress_modules=n"
# sed -i "s/$FIND/$REPLACE/g" PKGBUILD

FIND="_localmodcfg=n"
REPLACE="_localmodcfg=y"
sed -i "s/$FIND/$REPLACE/g" PKGBUILD

su -c "makepkg -s --skippgpcheck" $(whoami)


cd ..
rm -rf linux-xanmod-tt

echo
tput setaf 2
echo "################################################################"
echo "################### Stop"
echo "################################################################"
tput sgr0
echo
