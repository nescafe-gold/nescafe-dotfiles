1. Install git to clone this repo 
````
sudo pacman -S git
``````
2. Install reflector if you want to setup your pacman download mirrors based on region and download rate. 

````
sudo pacman -S reflector
``````
3. Setup your mirrors based on your country, https, and transfer rate
- [ ] create reflector command
4. clone repo
- [ ] create a script that installs rustup and sets "rustup default stable"
5. Install paru using rustup
6. install all the packages in the package file. The grep part excludes the comments and the whitespace in the file. 
````
paru -S $(grep -Ev '^#|^$' nescafe-dotfiles/packagelist.txt) --needed
````
7. Copy lightdm settings. Lightdm is the display manager (login manager)
````
sudo cp -r nescafe-dotfiles/lightdm /etc/lightdm
````
8. Sync all of the newly installed fonts
````
fc-cache -fv
````

- [ ] start and enable lightdm service once I have got it set up
