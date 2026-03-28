HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY       # save timestamps
setopt HIST_IGNORE_ALL_DUPS   # remove older duplicate entries
setopt HIST_IGNORE_SPACE      # don't record commands starting with space
setopt HIST_SAVE_NO_DUPS      # don't save duplicates
setopt SHARE_HISTORY          # share history across sessions

bindkey -e # emacs bindings

# Plugins (zsh-autocomplete must come before compinit; it calls compinit itself)
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Simple prompt
PROMPT='%F{magenta}%* %F{cyan}%~ %(?.%F{green}.%F{red})%#%f '

# PATH configuration
PATH=$PATH:~/.npm-global/bin
# Install packages locally to prevent interference with packages installed with pacman
export GEM_HOME="$(gem env user_gemhome)"
PATH="$PATH:$GEM_HOME/bin"

# Useful aliases
alias ls='ls --color=auto'
alias vim='nvim'
alias open='xdg-open'

# Fun tools
alias transcat='queercat -f transgender'
alias bicat='queercat -f bisexual'

source <(fzf --zsh)
export PATH="$HOME/.local/bin:$PATH"
