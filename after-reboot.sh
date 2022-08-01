#!/bin/bash


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


package=auto-cpufreq
if pacman -Qs $package > /dev/null ; then
    info_print "Enabling and starting the auto-cpufreq service"
    sudo systemctl enable --now auto-cpufreq
fi 

info_print "Changing permissions of snapshot subvolume & creating root snapshot config"
sudo umount /.snapshots
sudo rm -r /.snapshots
sudo snapper -c root create-config / 
sudo mount -a
sudo chmod 750 -R /.snapshots
sudo chmod a+rx /.snapshots
sudo chown :wheel /.snapshots

info_print "Creating the first root snapshot"
sudo snapper -c root create --description "Fresh Install" 

info_print "Setting root snapshot timings"
sudo sed -i 's/^TIMELINE_MIN_AGE.*/TIMELINE_MIN_AGE="1800"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_HOURLY.*/TIMELINE_LIMIT_HOURLY="0"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_DAILY.*/TIMELINE_LIMIT_DAILY="7"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_WEEKLY.*/TIMELINE_LIMIT_WEEKLY="0"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_MONTHLY.*/TIMELINE_LIMIT_MONTHLY="0"/' /etc/snapper/configs/root 
sudo sed -i 's/^TIMELINE_LIMIT_YEARLY.*/TIMELINE_LIMIT_YEARLY="0"/' /etc/snapper/configs/root

info_print "Enabling and starting Network Manager nftables and sshd"
sudo systemctl enable --now snapper-timeline.timer snapper-cleanup.timer
sudo systemctl disable NetworkManager-wait-online
sudo systemctl mask NetworkManager-wait-online
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now NetworkManager-dispatcher
sudo systemctl enable --now nftables
sudo systemctl enable --now sshd

package=chrony
if pacman -Qs $package > /dev/null ; then
    info_print "Enabling and starting chrony"
    sudo systemctl enable --now chronyd 
else
    info_print "Disabling and stopping timesync because chrony is not installed"
    sudo systemctl disable --now systemd-timesyncd.service
fi 

info_print "Enable and start reflector, apparmor, sshguard, memavalid, irqbalance, prelockd, nohang-desktop, dbus-broker, and refind btrfs"
sudo systemctl enable --now reflector
sudo systemctl enable --now apparmor 
sudo systemctl enable --now sshguard 
sudo systemctl enable --now memavaild 
sudo systemctl enable --now irqbalance 
sudo systemctl enable --now prelockd
sudo systemctl enable --now nohang-desktop
sudo systemctl enable --now dbus-broker
sudo systemctl enable --now refind-btrfs


input_print "Do you want to install my dotfiles? (Any option other than yes or y will choose no)? [y/N]?: "
read -r dotfiles_response
if ! [[ "${dotfiles_response,,}" =~ ^(yes|y)$ ]]
then
    continue
else
    chmod +x $HOME/nescafe-dotfiles/install-dots
    $HOME/nescafe-dotfiles/install-dots
fi


# Reconfigure sudo, so that a password is need to elevate privileges.
sudo sed -i '/^# %wheel ALL=(ALL) ALL/s/# //' /etc/sudoers # Uncomment line with sed
sudo sed -i '/^%wheel ALL=(ALL) NOPASSWD: ALL/s/^/# /' /etc/sudoers # Comment line with sed
