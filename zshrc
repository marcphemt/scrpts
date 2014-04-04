HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '/home/marcphemt/.zshrc'

#autoload
autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
autoload -U colors && colors
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=31=36"

#Prompt setup
autoload -U promptinit
promptinit
#prompt suse
PROMPT="%B[%U%{$fg_bold[blue]%}%n%u%{$reset_color%}@%m:%{$fg[green]%}%~%{$reset_color%}]%b>>"
RPROMPT="%U%B%{$fg[cyan]%}%D%b%u"

#options############################################################################

setopt appendhistory 
setopt autocd
setopt hist_ignore_all_dups 
setopt hist_ignore_space correctall

#Conf###############################################################################

[ ! "$UID" = "0" ] && archbey2
[  "$UID" = "0" ] && archbey2
echo "$fg[cyan]«Nosce te ipsum»$reset_color"
echo "$fg[cyan]Last -Syu:$reset_color $(grep "pacman -Syu" /var/log/pacman.log | tail -n1 | cut -c 2- | cut -c-16)"
echo ""

export GREP_COLOR='0;32'
export EDITOR=nano
export VISUAL=nano

alias ls='ls --color=auto'
alias grep="grep --color=auto"
alias aggiorna="sudo pacman -Syu"
alias clear="cd /home/marcphemt && source .zshrc"
alias cpu_freq="cpupower frequency-info"
alias aur="yaourt -Syua"
alias tastiera="setxkbmap -layout it"

##########################################################################################
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#Changing terminal window/icon titles####################################################

precmd () {print -Pn "\e]0;%n@%m: %~\a"}


which cx >&/dev/null || cx () { }

if [[ "$TERM" == ([Ex]term*|screen*) ]]; then
# Could also look at /proc/$PPID/cmdline ...
cx
fi

# }}}

source /home/marcphemt/script/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/marcphemt/script/zsh-substrings/zsh-substrings.zsh
