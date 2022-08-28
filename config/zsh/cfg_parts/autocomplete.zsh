autoload -U compinit && compinit -u

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ":completion:*" sort false
#zstyle ":completion:*" special-dirs true
#zstyle ":completion:*" ignored-patterns
#zstyle ":completion:*" completer _complete
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# completionlist & enable hidden files in suggestions
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
