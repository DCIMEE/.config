# Default location set in "$HOME/.zshrc"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
unsetopt beep
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'



# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments



# vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey '^v' edit-command-line
bindkey -v
bindkey -M vicmd "k" vi-insert
bindkey -M vicmd "K" vi-insert-bol
bindkey -M vicmd "n" vi-backward-char
bindkey -M vicmd "i" vi-forward-char
bindkey -M vicmd "N" vi-beginning-of-line
bindkey -M vicmd "I" vi-end-of-line
bindkey -M vicmd "e" down-line-or-history
bindkey -M vicmd "u" up-line-or-history
bindkey -M vicmd "l" undo
#bindkey -M vicmd "-" vi-rev-repeat-search
bindkey -M vicmd "=" vi-repeat-search
bindkey -M vicmd "h" vi-forward-word-end

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
	echo -ne '\e[5 q'
}

_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

source $HOME/Downloads/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
