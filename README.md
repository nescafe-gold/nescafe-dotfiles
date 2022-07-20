1. Install git to clone this repo 
````
sudo pacman -S git
``````
2. Setup your mirrors so you ge the fastest an closes tones (if this hasn't been done already)
````
sudo pacman -S reflector
``````

- [ ] create reflector command to setup repos
3. clone repo
- [ ] create a script that installs rustup and sets "rustup default stable"
5. Install paru using rustup
6. install all the packages in the package file. The grep part excludes the comments and the whitespace in the file. 
````
paru -S $(grep -Ev '^#|^$' nescafe-dotfiles/packagelist.txt) --needed
````
7. Copy lightdm settings. Lightdm is the display manager (login manager)
````
sudo cp nescafe-dotfiles/lightdm /etc/lightdm
````
