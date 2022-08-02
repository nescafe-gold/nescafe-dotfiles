typeset -U PATH path
##
## PATH & ENV Var
##

#ruby
export GEM_PATH="$XDG_DATA_HOME/ruby/gems"
export GEM_SPEC_CACHE="$XDG_DATA_HOME/ruby/specs"
export GEM_HOME="$XDG_DATA_HOME/ruby/gems"

#Go
export GOPATH="$XDG_DATA_HOME"/go

#npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
#export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PATH="$HOME/.cargo/bin:$PATH"


export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts/eww:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts/useful:$PATH"
export PATH="$HOME/scripts/statusbar:$PATH"

export TERMINAL="wezterm"
export EDITOR="lvim"
export READER="zathura"
export VISUAL="lvim"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="sxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export WM="awesome"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

## Comment this to use normal manpager
export MANPAGER='nvim +Man! +"set nocul" +"set noshowcmd" +"set noruler" +"set noshowmode" +"set laststatus=0" +"set showtabline=0" +"set nonumber"'

if [ $(echo $MANPAGER | awk '{print $1}') = nvim ]; then
  export LESS="--RAW-CONTROL-CHARS"
  export MANPAGER="less -s -M +Gg"

  export LESS_TERMCAP_mb=$'\e[1;32m'
  export LESS_TERMCAP_md=$'\e[1;32m'
  export LESS_TERMCAP_me=$'\e[0m'
  export LESS_TERMCAP_se=$'\e[0m'
  export LESS_TERMCAP_so=$'\e[01;33m'
  export LESS_TERMCAP_ue=$'\e[0m'
  export LESS_TERMCAP_us=$'\e[1;4;31m'
fi

# ZSH
export fpath=(/home/aidan/.config/zsh/zsh-completions $fpath)
export HISTFILE="$XDG_CONFIG_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

# trash-cli 
export FFF_TRASH_CMD="trash-put"
export FFF_TRASH=~/.local/share/Trash/files
export FFF_KEY_MKDIR="f"
export FFF_KEY_MKFILE="i"
export FFF_MARK_FORMAT="> %f"
export FFF_FILE_FORMAT=" %f"

# texlive-full variables
export PATH="/opt/texlive/2021/bin/x86_64-linux:$PATH"
export MANPATH="/opt/texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/opt/texlive/2021/texmf-dist/doc/info"

# Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS="1;1;1"
export GDK_SCALE=1
export GDK_DPI_SCALE=1

export SUDO_PROMPT="passwd: "
export FZF_DEFAULT_COMMAND='fd .'
export GPG_TTY="${TTY:-$(tty)}"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
export FFF_TRASH_CMD="trash-put"
export FFF_TRASH=~/.local/share/Trash/files
export FFF_KEY_MKDIR="f"
export FFF_KEY_MKFILE="i"
export FFF_TRASH=~/.local/share/Trash/files
export FFF_FAV1=~/videos/anime
export FFF_FAV2=~/documents/Uni
export FFF_FAV3=~/pictures/Wallpapers/wallpapers
export FFF_MARK_FORMAT="> %f"
export FFF_FILE_FORMAT=" %f"

export NNN_BMS='v:~/videos;a:~/videos/anime'
export NNN_TRASH=1
export NNN_PLUG='o:fzopen'

# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)


# vim:ft=zsh:nowrap
