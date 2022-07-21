##
## Plugins
##

source $HOME/.config/broot/launcher/bash/br

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null

# Search repos for programs that can't be found
source /usr/share/doc/find-the-command/ftc.zsh noprompt quiet

# FZF Plugins
source /usr/share/zsh/plugins/fzf/completion.zsh
source /usr/share/zsh/plugins/fzf/key-bindings.zsh
source /usr/share/fzf/fzf-extras.zsh

#z.lua
eval "$(lua $XDG_CONFIG_HOME/zsh/plugins/z.lua --init zsh enhanced)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# vim:ft=zsh
