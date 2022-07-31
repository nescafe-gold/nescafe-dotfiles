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
git clone https://github.com/nescafe-gold/nescafe-dotfiles.git
````
## Install Paru
Paru is my prefferred package manager for the AUR (Arch User Repository). I want to use rustup over the rust package because it allows me to use multiple rust builds, such as the "nightly" (development) build.
> **:memo: Note: 
> Why install Rust?**  
> Rust is a programming language that many apps are written in. The main reason to switch to other builds like the development one is to take advantage of new, and possibly unstable, features that haven't yet made it to the stable rust package or build.
>
> **changing rust builds is only possible with rustup, which is the reason I use it over rust.**

1. Install rustup (replace "rustup" with "rust" if you don't want to use rustup).
````
sudo pacman -S rustup
````
2. If you chose to install rustup, then you need to choose a default build. For now I will choose the stable build.
````
rustup default stable
````
3. Git clone the Paru repo, which contains the paru PKGFILE:
````
git clone https://aur.archlinux.org/paru.git
````
Change directory to the paru repo we just git cloned:
````
cd paru
````
Build the package in the repo. Make sure that you chose the rustup option when it asks, if that is what you want:
> **:warning: Important:**
>
> **If you chose rustup over rust then make sure you chose rustup when promoted** 
````
makepkg -si
````

# Installing all of the packages
The package list in this repo contains all of the packages that I like to install. Feel free to edit this list as you wish before installing from the list. You can add comments by starting the line with a # and you can add blank lines to separate blocks of packages.

The command below will install everything separated by a newline. The grep part of the command is excluding all of the comments that are prefixed with a # and it is excluding all blank lines.
````
paru -S $(grep -Ev '^#|^$' nescafe-dotfiles/packagelist.txt) --needed
````

# Setting up environment variables
You should already have zsh installed as it is the default on arch and if you used my install script.

First you will need to copy the zshenv file over to your home folder. 

Usually your .zshrc and the plugins (which are just .zsh scripts that are sourced in the .zshrc) would also go directly into your home folder. However, I try to keep my home folder de-cluttered, when I can be bothered. Therefore, my zshrc and plugins are located in ~/.config/zsh.

The reason why the .zshenv file is directly in the home folder is because without it being there, it wouldn't be possible to move a config file/directory to a different location than what the program is expecting. 

The way I move the zshrc and other programs' config files is through the use of environment variables that were programmed into the applications themselves. These variables are usually just a path to another location of the config file/directory. 
> **For example, the .zshenv file has only the following variable inside:**
>ZDOTDIR=$HOME/.config/zsh
>
>This variable is telling zsh to look inside ~/.config/zsh for the .zshenv, .zshrc, etc. file(s). 

1. Copy the config file, which contains the zsh configuration inside of $HOME/.config/zshrc, to your home directory. The zsh configuration folder contains a file where I define all of my environment variables, it is located in $HOME/.config/zsh/cfg_parts/env.zsh

NOTE TO SELF. ADD BLING MODULE ETC AS SUBMODULES
```
git clone --recurse-submodules https://github.com/nescafe-gold/nescafe-dotfiles.git ~/
```
```
cd dotfiles && git submodule update --remote --merge

```


2. Source your szhenv file, so that the environment variables defined there are applied to your current zsh shell session
```
source $HOME/.zshenv
```
Now that the ZDOTFIR variable points to $HOME/.config/zsh, we can source the .zshrc, which will source all of the other files in $HOME/.config/zsh/cfg_parts
```
source $HOME/.config/.zshrc
```

# Creating Directories Defined in env File
```
mkdir -p $HOME.local/share/fonts XDG_DATA_HOME XDG_CACHE_HOME XDG_CONFIG_HOME GEM_PATH GEM_SPEC_CACHE NPM_CONFIG_USERCONFIG GNUPGHOME _JAVA_OPTIONS GTK2_RC_FILES ZDOTDIR CARGO_HOME FFF_TRASH GEM_HOME GOPATH NPM_CONFIG_USERCONFIG NPM_PACKAGES NODE_PATH $HOME/.cargo/bin $HOME/.local.bin XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME XDG_CONFIG_DIRS XDG_DATA_DIRS XDG_RUNTIME_DIR XDG_DESKTOP_DIR XDG_DOWNLOAD_DIR XDG_TEMPLATES_DIR XDG_PUBLICSHARE_DIR XDG_DOCUMENTS_DIR XDG_MUSIC_DIR XDG_PICTURES_DIR XDG_VIDEOS_DIR FFF_TRASH MANPATH INFOPATH GNUPGHOME GTK2_RC_FILES
```







## Install Config Files

git clone --recurse-submodules https://github.com/rxyhn/dotfiles.git ~/

cd dotfiles && git submodule update --remote --merge

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

## Setting up your .config file
- [ ] Make instructions on making sure your shell is set to zsh 
1. Copy the config folders found in the repos to your .config folder 
````
cp -r nescafe-dotfiles/.config/* ~/.config
````

## Setting up ZSH



### ZSH Config
I have configured the config so that it is split up into multiple parts.

The **.zshrc** file is setup like an index file that sources files in the **cfg_parts** directory. Each file in this directory is a segmenmt of the zsh config that I split up for modularity and the index file (**.zshrc**) puts the parts together in the necessary order.

The **aliases** directory is where multiple types of aliases are stored. Again, each type of alias is split up into its own file, such as **applicationaliases** and **gitaliases**. These aliases are sourced by the **aliases.zsh** file located in **cfg_parts**.

The **plugins** directory is where plugins not managed by Pacman and Paru are stored. At the moment **z.lua** is the only plugin that fits this category. The plugins in this directory are sourced by the **plugins.zsh** file located in **cfg_parts**.

The **zsh-completions** directory is full of files that contain autocomplete data.

**history** is the history file. This file is where all of your commands are stored. This allows you to scroll through the history in your terminal by using the arrow keys.

1. You already copied the ZSH config to your .config earlier, when you copied the config directory located in this repo. As with any of the config files, feel free to edit them to your liking.

### Setting up Xresources

The file .Xresources is a config file for  colorscheme information

```
cp nescafe-dotfiles/.Xresources ~/
```


##  GTK Theme
```
sudo cp -rf themes/gtk/Aesthetic-Night/* /usr/share/themes
```
Add this line on ~/.config/gtk-3.0/settings.ini for left controls
```
```
gtk-decoration-layout=close,maximize,minimize:men
```

## libinput touchpad settings
```
cp 30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
```

Notes:
add programs that you want to start with the x session to .xprofile


