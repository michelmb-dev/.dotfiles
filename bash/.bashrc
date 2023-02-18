#
# ~/.bashrc
#
export PROMPT_DIRTRIM=1
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make colorcoding available for everyone

Black='\[\e[0;30m\]'	# Black
Red='\[\e[0;31m\]'		# Red
Green='\[\e[0;32m\]'	# Green
Yellow='\[\e[0;33m\]'	# Yellow
Blue='\[\e[0;34m\]'		# Blue
Purple='\[\e[0;35m\]'	# Purple
Cyan='\[\e[0;36m\]'		# Cyan
White='\[\e[0;37m\]'	# White

# Bold
BBlack='\[\e[1;30m\]'	# Black
BRed='\[\e[1;31m\]'		# Red
BGreen='\[\e[1;32m\]'	# Green
BYellow='\[\e[1;33m\]'	# Yellow
BBlue='\[\e[1;34m\]'	# Blue
BPurple='\[\e[1;35m\]'	# Purple
BCyan='\[\e[1;36m\]'	# Cyan
BWhite='\[\e[1;37m\]'	# White

# Background
On_Black='\[\e[40m\]'	# Black
On_Red='\[\e[41m\]'		# Red
On_Green='\[\e[42m\]'	# Green
On_Yellow='\[\e[43m\]'	# Yellow
On_Blue='\[\e[44m\]'	# Blue
On_Purple='\[\e[45m\]'	# Purple
On_Cyan='\[\e[46m\]'	# Cyan
On_White='\[\e[47m\]'	# White

NC='\[\e[m\]'			# Color Reset

ALERT="${BWhite}${On_Red}" # Bold White on red background

# Useful aliases
alias c='clear'
alias ..='cd ..'
alias ls='ls -CF --color=auto'
alias ll='s -lisa --color=auto'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias histg='history | grep'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias maj='sudo pacman -Syyu'
alias aur='trizen -Syyu'
alias err='journalctl -p 3 -xb'
alias emul='emulator -avd Nexus_6_API_30 -netdelay none -netspeed full &'

# Set PATH so it includes user's private bin directories
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

# Set prompt
#PS1="${BRed}\u@\h${NC}: ${Blue}\w${NC} \\$ "

PS1="${BRed}MbArchLinux${BYellow}\w${BGreen}$ ${NC}"
source /usr/share/nvm/init-nvm.sh

# For android studio
export ANDROID_HOME=/home/michel/Android/Sdk
export ANDROID_SDK_ROOT=/home/michel/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platforms-tools
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export CAPACITOR_ANDROID_STUDIO_PATH=/usr/bin/android-studio

# pnpm
export PNPM_HOME="/home/michel/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


