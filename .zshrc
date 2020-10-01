#t0=`/opt/local/bin/gdate +%s.%N`

# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _list _oldlist _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' condition 8
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort access
zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=8
zstyle ':completion:*' original true
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt '%l'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true
#zstyle :compinstall filename '/Users/webb/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

### zsh stuff

# make delete key work
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# make option arrow keys work
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

setopt EXTENDED_HISTORY

## no dupes in history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# include command duration in history
setopt INC_APPEND_HISTORY_TIME


## history search

# seach history initial string with up/down
#
#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "^[[A" up-line-or-beginning-search
#bindkey "^[[B" down-line-or-beginning-search
# preceding was occasionally buggy, so instead, just:
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


# search history midstring with option-up/down
# option-up/down for partial match (maybe [A/B only work on mac?)
source ~/.zsh/zsh-history-substring-search.zsh
bindkey "[A" history-substring-search-up
bindkey "[B" history-substring-search-down


# autosuggest in grey from history

source ~/.zsh/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle git
antigen bundle popstas/zsh-command-time
antigen apply
ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd)

bindkey '^[[[SE' autosuggest-execute

# needs fix; error:
# No such widget `autosuggest-cycle-strategy'
#function autosuggest-cycle-strategy {
#	ZSH_AUTOSUGGEST_STRATEGY=($x[2] $x[1])
#}
#bindkey "^[[A" autosuggest-cycle-strategy

# show time of long commands
ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="%s"
ZSH_COMMAND_TIME_COLOR="gray"

# don't weirdly remove trailing slash from directory
setopt no_auto_remove_slash

# 
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# not specific to zsh
[ -e ~/.env ] && source ~/.env


# prompt
#PS1='%F{blue}%m%f%F{black}:%~%f '
source ~/.zsh/git-prompt.sh
setopt PROMPT_SUBST
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=verbose
GIT_PS1_SHOWCOLORHINTS=1
# choose prompt color based on hostname
case `hostname | awk '{print substr($1,1,1)}' | od -A n -t d1 | awk '{print $1%6}'` in
	1)
		color=green
		;;
	0)
		color=blue
		;;
	2)
		color=cyan
		;;
	3)
		color=red
		;;
	4)
		color=yellow
		;;
	5)
		color=magenta
		;;
esac
precmd () { __git_ps1 "%F{NONE}%n@%F{$color}mac%f %F{NONE}%~%f" " " }

#/opt/local/bin/gdate +%s.%N | awk -v t0=$t0 '{printf "%d ms\n", 1000*($1-t0)}'

export TZ='Europe/Amsterdam'
