#!/bin/zsh

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

if [[ "$OSTYPE" == "darwin"* ]]; then
  export IDEA_PROPERTIES=${XDG_CONFIG_HOME:-$HOME/.config}/intellij
fi

# rbenv
eval "$(rbenv init - zsh)"

# pyenv
[[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/pyenv ]] \
  && export PYENV_ROOT="${XDG_CONFIG_HOME:-$HOME/.config}/pyenv" \
  && export PATH="$PYENV_ROOT/bin:$PATH"

# goenv
[[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/goenv ]] \
  && export GOENV_ROOT=${XDG_CONFIG_HOME:-$HOME/.config}/goenv \
  && export PATH=$GOENV_ROOT/bin:$PATH \
  && export GOPATH=$HOME/go

# SDKMAN
[[ -d ${XDG_CONFIG_HOME:-$HOME/.config}/sdkman ]] \
  && export SDKMAN_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/sdkman" \
  && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# nvm
if [ -d ${XDG_CONFIG_HOME:-$HOME/.config}/nvm ]; then
  export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
  nvm_cmds=(nvm node npm)
  for cmd in $nvm_cmds ; do
    alias $cmd="unalias $nvm_cmds && unset nvm_cmds && . $NVM_DIR/nvm.sh && $cmd"
  done
fi

# Load aliases and shortcuts etc if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/config" ] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/config"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/prompt" ] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/prompt"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/alias" ] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/alias"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/keybinding" ] \
  &&  source "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/keybinding"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/functions" ] \
  &&  source "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/functions"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/fzf" ] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/settings/fzf"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/shortcut/shortcut" ] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/shortcut/shortcut"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/shortcut/zshnameddir" ] \
  && source "${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/config/zsh/shortcut/zshnameddir"

## zsh-autosuggestions
source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Load syntax highlighting; should be last.
source  ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

