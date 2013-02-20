K=$(uname -r)

TXTGRN='\[\e[0;32m\]' # Green
TXTRST='\[\e[0m\]'    # Text Reset
TXTCYN='\[\e[0;36m\]' # Cyan
TXTPUR='\[\e[0;35m\]' # Purple
TXTYLW='\[\e[0;33m\]' # Yellow


BROWSER=/usr/bin/firefox
export GTK_IM_MODULE="xim"
# Check for an interactive session
[ -z "$PS1" ] && return

 # some more aliases
alias sl="sudo gedit /etc/apt/sources.list"
alias install='sudo apt-get install'
alias reinstall='sudo apt-get install --reinstall'
alias finstall='sudo apt-get -f install'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get dist-upgrade'
alias dupgrade='sudo apt-get update && sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agu='sudo  apt-get update'
alias agg='sudo apt-get dist-upgrade'
alias agug='sudo apt-get update && sudo apt-get dist-upgrade'
alias remove='sudo apt-get remove'
alias autoremove='sudo apt-get autoremove'
alias purge='sudo apt-get remove --purge'
alias agp='sudo apt-get autoremove --purge'
alias agar='sudo apt-get autoremove'
alias add='sudo add-apt-repository'
alias search='apt-cache search'
alias clean='sudo apt-get clean'
alias autoclean='sudo apt-get autoclean'
alias sinstall='sudo apt-get install --no-install-recommends'
alias gae='~/Github/wallproxy/local/startup.py'
eval `dircolors .dir_colors`
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias github='cd ~/Github'
export TERM=xterm-256color


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PS1="┌─( $TXTGRN\u$TXTRST ) - ( $TXTPUR$K$TXTRST ) - ( $TXTCYN\w$TXTRST )\n└─> "
