#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS

# Show hostname and working directory in window title format titles for screen and rxvt
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  if [ $a ]
  then
    a=" — $a"
  fi
  print -Pn "\e]2;$2:$3$a\a" # plain xterm title
}
 
# preexec is called just before any command line is executed
function preexec() {
  #title "$1" "$USER@%m" "%35<...<%~"
  title "$1" "Terminal" "%35<...<%~"
}
# precmd is called just before the prompt is printed
function precmd () {
  title "" "Terminal@$USER" "%55<...<%~"
}


# Complétion 
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

# Complétion des commandes kill killall
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*' menu yes select

# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Correction des commandes
setopt correctall
 
# Un petit prompt sympa
# autoload -U promptinit
# promptinit
# prompt arch 8bit
 
# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'
# mplayer en plein framme buffer ;)
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
# Un grep avec des couleurs :
export GREP_COLOR=mt=31
alias grep='grep --color=auto'
alias -g G=' | grep '
# Créer dossier avec parents si non existants en mode verbose
alias mkdir='mkdir -pv'
# nettoyer l'écran
alias c='clear'
# xte lancera un xterm qui ne se fermera pas si on ferme le terminal
alias xte='nohup xterm &'
# erreur système
alias err='journalctl -p 3 -xb'
# Mise à jour
alias maj='sudo pacman -Syu'
# voir son adresse IP
alias myip='curl ipv4.icanhazip.com'
# wget en couleur
alias wget='wget -c'
# processus en cours
alias ps='ps auxf'
# Mémoire dispo
alias free='free -mt'

# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim

# Touche de commande
bindkey "^[[7~" beginning-of-line
bindkey "\e[H" beginning-of-line 
bindkey "\e[F" end-of-line 
bindkey "\e[F" end-of-line 
bindkey "^[[2~" overwrite-mode
bindkey "\e[3~" delete-char
bindkey "^F" history-incremental-search-backward
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word
bindkey "^[[3^" backward-kill-line
bindkey "^[[5^" up-line-or-history
bindkey "^[[6^" down-line-or-history
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search


# Zsh-Syntax-highlighting
source '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'
source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
source '/home/michel/.config/zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh'
# source '/home/michel/.config/zsh/git-prompt/git-prompt.zsh'
# source '/home/michel/.config/zsh/git-prompt/themes/arch_prompt.zsh'
#source '/usr/share/nvm/init-nvm.sh'


# For android studio
export ANDROID_HOME=/home/michel/Android/Sdk
export ANDROID_SDK_ROOT=/home/michel/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platforms-tools
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export CAPACITOR_ANDROID_STUDIO_PATH=/usr/bin/android-studio


alias emul='emulator -avd Nexus_6_API_30 -netdelay none -netspeed full &'

