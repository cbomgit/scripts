# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/christian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit
promptinit

autoload -U colors && colors

#if [ $SSH_CONNECTION ]; then
#   PROMPT="//$(echo $SSH_CONNECTION | awk '{print $1}')/%M%d %# "
#else
#   PROMPT="//%M%d %# "
#fi

PROMPT="%{$fg[green]%}%M@$USER %~%{$reset_color%} %# "

export AWT_TOOLKIT=XToolkit

alias sys='sudo systemctl'
alias net='sudo netctl'
alias ncmpcpp='ncmpcpp -h alarmpi'
alias mpc='mpc -h alarmpi'
alias refresh='sudo pacman -Syy'
alias ls='ls --color=auto'
alias netctl='sudo netctl'
alias get='sudo pacman -S'
alias remove='sudo pacman -Rs'
alias erase='sudo pacman -Rns'
alias update='sudo pacman -Syu'
alias pac-clean='sudo pacman -Sc'
alias free='free -h'
alias df='df -h'
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'
alias vi='vim'
alias svi='sudo vim'
alias dim='xset +dpms; xset s on'
alias nodim='xset -dpms; xset s off'
alias open='xdg-open $(pwd) &'

alias poweroff='sudo systemctl poweroff'
alias rest='sudo systemctl suspend'
alias reboot='sudo systemctl reboot'
alias svim='sudo vim'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias enables='sudo systemctl enable'
alias disables='sudo systemctl disable'
alias restart='sudo systemctl restart'
alias status='systemctl status'
alias feh='feh -g 1366x768'
alias ustart='systemctl --user start'
alias ustop='systemctl --user stop'
alias ustatus='systemctl --user status'
alias urestart='systemctl --user restart'
alias uenable='systemctl --user enable'
alias udisable='systemctl --user disable'
alias xmerge='xrdb -merge .Xresources'
alias bootWin='sudo extlinux -o windows /boot/syslinux/ && sudo systemctl reboot'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

iwp    () { sudo iwconfig wlp1s0 power $1 }
userlog() { journalctl --user-unit=$1; }

cd     () { builtin cd $1 && ls }
chdir  () { mkdir "$1" && builtin cd $1 }
bk     () { if [[ "$(stat -c %U $1)" == "root" ]]; then sudo $2 $1 $1.bak; else $2 $1 $1.bak; fi }
rbk    () { if [[ "$(stat -c %U $1)" == "root" ]]; then sudo $2 $1.bak $1; else $2 $1.bak $1; fi }
zshconf() { vim $HOME/.zshrc; source $HOME/.zshrc; }

ckpkg() 
{

    pacman -Q > installed.txt
    less installed.txt
    rm installed.txt > /dev/null

}


sshpi() 
{

   OLD_TERM=$TERM
   TERM=xterm
   ssh pi@xbmc-60e5
   TERM=$OLD_TERM

}

export DS=~/Documents/school/Data_Structures
export INP=~/Documents/school/Intermediate
export EC=~/Documents/school/English_Comp
export DM=~/Documents/school/Discrete
export HMWK=~/Documents/school/
export XDG_CONFIG_HOME=/home/christian/.config

case $TERM in 
   xterm*)
      chpwd () { print -Pn "\e]0;%d\a"}
      precmd () { print -Pn "\e]0;%d\a"}
      preexec () { print -Pn "\e]0;$1\a"}
      ;;
esac


PATH="$PATH:/home/christian/.bin"
