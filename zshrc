setopt autocd autopushd pushdignoredups
autoload -U colors && colors
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history           # append to histfile instead of overwriting
setopt hist_expire_dups_first   # prune duplicate commands before unique from history
setopt hist_ignore_space        # remove commands with starting whitespace from history
setopt share_history            # append and import history between terminals

setopt complete_in_word

bindkey -v
export KEYTIMEOUT=1

#colored man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey '^i' autosuggest-accept
bindkey '[[Z' autosuggest-accept
bindkey '^p' up-history
bindkey '^n' down-history
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-word
bindkey '^f' forward-word
bindkey '^j' menu-complete
bindkey '^k' reverse-menu-complete
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history

autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

function take() {    mkdir -p $@ && cd ${@:$#}  }

function invim() {
    local fname
    local current_dir=$PWD
    fname=$(fzf) || return
    nvim "$fname"
    cd $current_dir
}
bindkey -s '^v' 'invim^M'

# ctrl-x: insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^x' insert-last-command-output

bindkey -s '^o' 'lf^M'

# Load zsh plugins
for f in ~/dotfiles/config/shellconfig/*; do source $f; done
source "$(brew --prefix)/etc/profile.d/z.sh"
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
