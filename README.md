# Setting up my dotfiles from a clean Arch Linux install

## Prepare for package installation
1. Install git to clone this repo 
````bash
sudo pacman -S git
``````
2. Install reflector if you want to setup your pacman download mirrors based on region and download rate. 
````bash
sudo pacman -S reflector
``````
3. Setup your mirrors based on your country, https, and transfer rate
- [ ] create reflector command

## Clone repo

````
git clone https://nescafe-gold/nescafe-dotfiles.git
````
## Install Paru
Paru is my prefferred package manager for the AUR (Arch User Repository). I want to use rustup over the rust package because it allows me to use multiple rust builds, such as the "nightly" (development) build.
> **:memo: Note: Why install Rust?**  
> Rust is a programming language that many apps are written in. The main reason to switch to other builds like the development one is to take advantage of new, and possibly unstable, features that haven't yet made it to the stable rust package or build.
>
> changing builds is only possible with rustup, which is the reason I use it over rust.

1. Install rustup (replace "rustup" with "rust" if you don't want to use rustup).
````
sudo pacman -S rustup
````
2. If you chose to install rustup, then you need to choose a default build. The choice of builds is the advantage of rustup. For now I will choose the stable build.
````
rustup default stable
````
3. Install paru using rustup
git clone the paru repo that contains the paru PKGFILE:
````
git clone https://aur.archlinux.org/paru.git
````
change directory to the paru repo we just git cloned:
````
cd paru
````
build the package in the repo. Make sure that you chose the rustup option when it asks, if that is what you want:
````
makepkg -si
````

## Install all of your packages
The package list in this repo contains all of the packages that I like to install. Feel free to edit this list as you wish before installing from the list. You can add comments by starting the line with a # and you can add blank lines to separate blocks of packages.

The command below will will install everything separated by a newline. The grep part of the command is excluding all of the comments that are prefixed with a # and it is excluding all blank lines.
````
paru -S $(grep -Ev '^#|^$' nescafe-dotfiles/packagelist.txt) --needed
````

## Setup the LightDM Display Manager
I chose to install LightDM as my display manager (login manager). My settings are extremely basic because I've never riced a display manager before. I will update the settings over time.

1. Copy my lightdm settings.
````
sudo cp -r nescafe-dotfiles/lightdm /etc/lightdm
````
- [ ] start and enable lightdm service once I have got it set up

# Setup fonts
You have already downloaded a lot of fonts earlier from the package list; however, I have some more that can no longer be downloaded from the repos. I still have the files and they are in the font folder of this repo.

1. Copy the fonts to a font directory
````
cp -r nescafe-dotfiles/fonts/* ~/.local/share/fonts
````
2. Sync all of the newly installed fonts
````
fc-cache -fv
````

