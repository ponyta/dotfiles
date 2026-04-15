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
bindkey '\e[3~' delete-char        # Delete key
bindkey '\e[1;3C' forward-word     # Alt+Right
bindkey '\e[1;3D' backward-word    # Alt+Left

# Completion
autoload -Uz compinit && compinit
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
elif [[ -f ~/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source ~/powerlevel10k/powerlevel10k.zsh-theme
fi
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

# fzf shell integration: newer versions use --zsh, older Ubuntu installs use static files
if fzf --zsh &>/dev/null; then
  source <(fzf --zsh)
elif [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  [[ -f /usr/share/doc/fzf/examples/completion.zsh ]] && source /usr/share/doc/fzf/examples/completion.zsh
fi
export PATH="$HOME/.local/bin:$PATH"
