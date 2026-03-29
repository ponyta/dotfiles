# Enable Powerlevel10k instant prompt (must be at the very top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY       # save timestamps
setopt HIST_IGNORE_ALL_DUPS   # remove older duplicate entries
setopt HIST_IGNORE_SPACE      # don't record commands starting with space
setopt HIST_SAVE_NO_DUPS      # don't save duplicates
setopt SHARE_HISTORY          # share history across sessions

bindkey -e # emacs bindings

# Completion
autoload -Uz compinit && compinit
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

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
