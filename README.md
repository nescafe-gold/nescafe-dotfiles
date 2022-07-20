1. sudo pacman -S git reflector
2. run reflector command to setup repos
3. clone repo
4. create a script that installs rustup and sets "rustup default stable"
5. Installs paru using rustup
6. paru -S $(grep -Ev '^#|^$' packagelist.txt) --needed
7. sudo cp nescafe-dotfiles/lightdm /etc/lightdm
