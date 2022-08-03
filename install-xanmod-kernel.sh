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

# Pretty print (function).
info_print () {
    echo -e "${BOLD}${BGREEN}[ ${BYELLOW}•${BGREEN} ] $1${RESET}"
}

# Pretty print for input (function).
input_print () {
    echo -ne "${BOLD}${BYELLOW}[ ${BGREEN}•${BYELLOW} ] $1${RESET}"
}

# Alert user of bad input (function).
error_print () {
    echo -e "${BOLD}${BRED}[ ${BBLUE}•${BRED} ] $1${RESET}"
}

echo
tput setaf 2
echo "################################################################"
echo "################### modprobed-db to install"
echo "################################################################"
tput sgr0
echo

username=$(whoami)

#https://wiki.archlinux.org/title/Modprobed-db

package="modprobed-db"
if paru -Qs $package > /dev/null ; then
    continue
else
    su -c "paru -S modprobed-db --noconfirm --needed" $username
fi

su -c "modprobed-db" $username
su -c "modprobed-db store" $username
su -c "systemctl --user enable --now modprobed-db.service" $username
su -c "sudo modprobed-db rebuild " $username

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

git clone https://aur.archlinux.org/linux-xanmod-tt.git $HOME/linux-xanmod-tt
cd $HOME/linux-xanmod-tt

FIND="_microarchitecture=0"
REPLACE="_microarchitecture=98"
sed -i "s/$FIND/$REPLACE/g" $HOME/linux-xanmod-tt/PKGBUILD

# FIND="use_numa=y"
# REPLACE="use_numa=n"
# sed -i "s/$FIND/$REPLACE/g" $HOME/linux-xanmod-tt/PKGBUILD

# FIND="use_tracers=y"
# REPLACE="use_tracers=n"
# sed -i "s/$FIND/$REPLACE/g" $HOME/linux-xanmod-tt/PKGBUILD

# FIND="_compiler=gcc"
# REPLACE="_compiler=gcc"
# sed -i "s/$FIND/$REPLACE/g" $HOME/linux-xanmod-tt/PKGBUILD

# FIND="_compress_modules=n"
# REPLACE="_compress_modules=n"
# sed -i "s/$FIND/$REPLACE/g" $HOME/linux-xanmod-tt/PKGBUILD

FIND="_localmodcfg=n"
REPLACE="_localmodcfg=y"
sed -i "s/$FIND/$REPLACE/g" $HOME/linux-xanmod-tt/PKGBUILD

su -c "makepkg -s --skippgpcheck -f" $(whoami)


cd $HOME
rm -rf $HOME/linux-xanmod-tt

echo
tput setaf 2
echo "################################################################"
echo "################### Stop"
echo "################################################################"
tput sgr0
echo
