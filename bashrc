# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#alias get_idf='. $HOME/esp/esp-idf/export.sh'
#export IDF_PATH=~/esp/esp-idf
#export PATH="$IDF_PATH/tools:$PATH"

source /opt/ros/humble/setup.bash
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash 
source ~/ros2_ws/install/setup.bash 

alias rossetup="source ~/ros2_ws/install/setup.bash "

alias brc='gedit ~/.bashrc'

alias pyenv='source venv/bin/activate'

alias idf='source /media/ibrahim/a/ESPRESSIF_IDF/v5.3.1/esp-idf/export.sh'

#export TURTLEBOT3_MODEL=waffle_pi 


# Aesthetically Pleasing Bash Configuration
# Reset previous settings to avoid conflicts
unset PROMPT_COMMAND
PS1=""

# Colors with proper escaping for PS1
RESET="\[\033[0m\]"
BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
BOLD_BLACK="\[\033[1;30m\]"
BOLD_RED="\[\033[1;31m\]"
BOLD_GREEN="\[\033[1;32m\]"
BOLD_YELLOW="\[\033[1;33m\]"
BOLD_BLUE="\[\033[1;34m\]"
BOLD_MAGENTA="\[\033[1;35m\]"
BOLD_CYAN="\[\033[1;36m\]"
BOLD_WHITE="\[\033[1;37m\]"

# Fix for echo color output in functions
ECHO_RESET="\033[0m"
ECHO_BLACK="\033[0;30m"
ECHO_RED="\033[0;31m"
ECHO_GREEN="\033[0;32m"
ECHO_YELLOW="\033[0;33m"
ECHO_BLUE="\033[0;34m"
ECHO_MAGENTA="\033[0;35m"
ECHO_CYAN="\033[0;36m"
ECHO_WHITE="\033[0;37m"
ECHO_BOLD_BLACK="\033[1;30m"
ECHO_BOLD_RED="\033[1;31m"
ECHO_BOLD_GREEN="\033[1;32m"
ECHO_BOLD_YELLOW="\033[1;33m"
ECHO_BOLD_BLUE="\033[1;34m"
ECHO_BOLD_MAGENTA="\033[1;35m"
ECHO_BOLD_CYAN="\033[1;36m"
ECHO_BOLD_WHITE="\033[1;37m"

# Enhanced git status function with untracked changes indicator
parse_git_status() {
    local git_status=$(git status -s 2> /dev/null)
    local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    
    if [ -n "$branch" ]; then
        local status_indicators=""
        
        # Check for untracked files
        if echo "$git_status" | grep -q '?? '; then
            status_indicators+="?"
        fi
        
        # Check for modified files
        if echo "$git_status" | grep -q ' M\| A\| D\| R\| C'; then
            status_indicators+="*"
        fi
        
        # Check for staged files
        if echo "$git_status" | grep -q '^M\|^A\|^D\|^R\|^C'; then
            status_indicators+="+"
        fi
        
        # Display branch with status indicators
        echo -n "[$branch"
        if [ -n "$status_indicators" ]; then
            echo -n "|$status_indicators"
        fi
        echo -n "]"
    fi
}

# Function to get exit status color
exit_status_color() {
    if [ $? -eq 0 ]; then
        echo -e "${ECHO_BOLD_GREEN}✓${ECHO_RESET}"  # Green checkmark for success
    else
        echo -e "${ECHO_BOLD_RED}✗${ECHO_RESET}"  # Red X for error
    fi
}

# Function to get current time (HH:MM)
current_time() {
    date +"%H:%M"
}

# Enhanced system info for welcome message
function clean_sysinfo() {
    local weather_info=""
    local ip_address=$(hostname -I 2>/dev/null | awk '{print $1}')
    local disk_usage=$(df -h / | awk 'NR==2 {print $5 " of " $2 " used"}')
    
    echo ""
    echo -e "${ECHO_BOLD_CYAN}╔════════════════════════════════════════╗${ECHO_RESET}"
    echo -e "${ECHO_BOLD_CYAN}║            SYSTEM INFORMATION          ║${ECHO_RESET}"
    echo -e "${ECHO_BOLD_CYAN}╚════════════════════════════════════════╝${ECHO_RESET}"
    echo -e "${ECHO_BOLD_CYAN}$(uname -sr)${ECHO_RESET}"
    echo -e "${ECHO_CYAN}$(date +"%A, %d %B %Y, %H:%M:%S")${ECHO_RESET}"
    echo -e "${ECHO_YELLOW}Uptime:${ECHO_RESET} $(uptime -p | sed 's/up //')"
    echo -e "${ECHO_MAGENTA}Memory:${ECHO_RESET} $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
    echo -e "${ECHO_BOLD_RED}CPU:${ECHO_RESET} $(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.1f%%", usage}')"
    echo -e "${ECHO_GREEN}Disk:${ECHO_RESET} ${disk_usage}"
    
    if [ -n "$ip_address" ]; then
        echo -e "${ECHO_BLUE}IP:${ECHO_RESET} ${ip_address}"
    fi
    
    # Check for pending updates if apt is available
    if command -v apt > /dev/null; then
        local updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
        if [ "$updates" -gt 0 ]; then
            echo -e "${ECHO_BOLD_YELLOW}Updates:${ECHO_RESET} ${updates} package(s) can be upgraded"
        fi
    fi
    
    # Check for running services
    local processes=$(ps aux | wc -l)
    echo -e "${ECHO_CYAN}Processes:${ECHO_RESET} $((processes-1))"
    
    echo ""
}

# Directory size function
dirsize() {
    du -sh "${1:-.}" | sort -hr
}

# Function to extract various archive types
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar e "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick directory navigation
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Enhanced aliases
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lah --color=auto'
alias lt='ls -lahtr --color=auto'  # List by time, reversed
alias l.='ls -lhd .* --color=auto' # List hidden files
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias today='date +"%d-%m-%Y"'
alias wget='wget -c'
alias update='sudo apt update && sudo apt upgrade -y'
alias ports='netstat -tulanp'

# Git aliases
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gpull='git pull'

# File search
alias ff='find . -type f -name'
alias fd='find . -type d -name'

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
shopt -s cmdhist

# Ignore duplicates in history and some common commands
export HISTIGNORE="&:ls:ll:la:cd:exit:clear:history"

# Check window size after each command
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Clean and elegant multi-line prompt with time, exit status and git information
prompt_command() {
    local EXIT="$?"
    local EXIT_STATUS=""
    
    # Set exit status indicator
    if [ $EXIT -eq 0 ]; then
        EXIT_STATUS="${BOLD_GREEN}✓${RESET}"
    else
        EXIT_STATUS="${BOLD_RED}✗ $EXIT${RESET}"
    fi
    
    # Set terminal title
    echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD/$HOME/~}\007"
}

PROMPT_COMMAND=prompt_command

# Custom multi-line prompt with added features
PS1="\n${BOLD_BLUE}┌─[${RESET}${BOLD_CYAN}\u${RESET}${BOLD_BLUE}@${RESET}${BOLD_GREEN}\h${RESET}${BOLD_BLUE}]─[${RESET}${YELLOW}\w${RESET}${BOLD_BLUE}]─[${RESET}${WHITE}\$(current_time)${RESET}${BOLD_BLUE}]${RESET}${MAGENTA}\$(parse_git_status)${RESET} \$(if [ \$? -eq 0 ]; then echo \"${BOLD_GREEN}✓${RESET}\"; else echo \"${BOLD_RED}✗${RESET}\"; fi)\n${BOLD_BLUE}└─▶${RESET} "

# Show clean system info at login, only once
if [ "$SHLVL" = 1 ]; then
    clean_sysinfo
fi

# Set a large command history
export HISTSIZE=10000

# Set colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Weather function - requires curl and an internet connection
weather() {
    local city="${1:-}"
    if [ -z "$city" ]; then
        curl -s "wttr.in/?q&format=3"
    else
        curl -s "wttr.in/$city?q&format=3"
    fi
}

# Quick note taking
note() {
    local notes_dir="$HOME/notes"
    mkdir -p "$notes_dir"
    
    if [ -z "$1" ]; then
        # List all notes
        echo -e "${ECHO_BOLD_CYAN}Notes:${ECHO_RESET}"
        ls -la "$notes_dir"
    else
        # Open or create a note
        $EDITOR "$notes_dir/$1.md"
    fi
}

# Function to display cheatsheet for common commands
cheatsheet() {
    local command="$1"
    if [ -z "$command" ]; then
        echo -e "${ECHO_BOLD_YELLOW}Available cheatsheets:${ECHO_RESET} git, bash, vim, tmux"
        return
    fi
    
    case "$command" in
        git)
            echo -e "${ECHO_BOLD_GREEN}Git Cheatsheet:${ECHO_RESET}"
            echo -e "${ECHO_YELLOW}git init${ECHO_RESET} - Initialize a repository"
            echo -e "${ECHO_YELLOW}git clone [url]${ECHO_RESET} - Clone a repository"
            echo -e "${ECHO_YELLOW}git add [file]${ECHO_RESET} - Add file to staging"
            echo -e "${ECHO_YELLOW}git commit -m [msg]${ECHO_RESET} - Commit changes"
            echo -e "${ECHO_YELLOW}git status${ECHO_RESET} - Check status"
            echo -e "${ECHO_YELLOW}git pull${ECHO_RESET} - Pull changes"
            echo -e "${ECHO_YELLOW}git push${ECHO_RESET} - Push changes"
            echo -e "${ECHO_YELLOW}git branch${ECHO_RESET} - List branches"
            echo -e "${ECHO_YELLOW}git checkout [branch]${ECHO_RESET} - Switch branches"
            ;;
        bash)
            echo -e "${ECHO_BOLD_GREEN}Bash Cheatsheet:${ECHO_RESET}"
            echo -e "${ECHO_YELLOW}ctrl+a${ECHO_RESET} - Move to beginning of line"
            echo -e "${ECHO_YELLOW}ctrl+e${ECHO_RESET} - Move to end of line"
            echo -e "${ECHO_YELLOW}ctrl+r${ECHO_RESET} - Search history"
            echo -e "${ECHO_YELLOW}ctrl+l${ECHO_RESET} - Clear screen"
            echo -e "${ECHO_YELLOW}ctrl+u${ECHO_RESET} - Cut line before cursor"
            echo -e "${ECHO_YELLOW}ctrl+k${ECHO_RESET} - Cut line after cursor"
            echo -e "${ECHO_YELLOW}ctrl+y${ECHO_RESET} - Paste cut text"
            ;;
        *)
            echo -e "${ECHO_RED}No cheatsheet available for $command${ECHO_RESET}"
            ;;
    esac
}

# Improved cd command that lists directory after changing
cd() {
    builtin cd "$@" && ls -la
}

