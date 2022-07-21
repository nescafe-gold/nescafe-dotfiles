# If not running interactively, don't do anything
[[ $- != *i* ]] && return

while read file
do 
  source "$ZDOTDIR/cfg_parts/$file.zsh"
done <<-EOF
theme
env
aliases
utility
options
plugins
keybinds
prompt
autocomplete
vim_mode
EOF

# vim:ft=zsh:nowrap
