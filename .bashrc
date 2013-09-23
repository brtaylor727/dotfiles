if [ -r /opt/applications/Modules/current/init/bash ]; then
    source /opt/applications/Modules/current/init/bash
fi

# source bash completion
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# source custom bash completions
if [ -f $HOME/.bash_completion ]; then
    source $HOME/.bash_completion
fi

if [ -f $HOME/.git_completion ]; then
    source $HOME/.git_completion
fi

# source custom aliases
if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

# source bash functions
if [ -f $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

# source dircolors definitions
if [ -f "$HOME/.dir_colors" ]; then
    eval $(dircolors -b $HOME/.dir_colors)
fi

ulimit -S -c 0        # Don't want any coredumps
set -o noclobber
set -o ignoreeof

shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s expand_aliases

#shopt -s cdable_vars
#shopt -s mailwarn
#shopt -s cmdhist
#shopt -s histappend histreedit histverify
#shopt -s lithist
#shopt -s extglob
#shopt -s dotglob
#shopt -s progcomp
#shopt -s promptvars
#shopt -s hostcomplete
#shopt -s interactive_comments

complete -d pd cd rmd

##############################
# ##### PROMPT SECTION ##### #
##############################
# setup color variables
function prompt  {
    local NONE="\[\033[0m\]"    # unsets color to term's fg color

    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white

    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"

    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"

    if [ $UID == 0 ]; then
        local UC="${EMR}"
    else
        local UC="${G}"
    fi

    color="$(eval echo '$'$1)"

    if [ "$2" == "" ]; then
        local HH=$HOSTNAME
    else
        local HH="$2"
    fi

    if [ "$DISPLAY" == "" ]; then
        local X=""
    else
        local X=" ${C}⦿"
    fi

    local TITLEBAR="\[\e]0;\u@${HH}\a\]"
    local PREFIX="${W}${UC}\u${W}@${color}${HH}${W}:${Y}\w${W}$"
    local GIT="${EMM}\$(__git_ps1)"
    local SUFFIX="${EMG}\t \d${X} ${W}\\\$${NONE} "

    PS1="${TITLEBAR}${PREFIX}${GIT}\n${SUFFIX}"
}

case $HOSTNAME in
    patsalo*)   prompt B;;
    greenlab*)  prompt BGG;;
    *seawulf)   prompt BGB;;
    garibaldi*) prompt W garibaldi;;
    gpfs00*)    prompt Y hpcdata;;

    *)          prompt K;;
esac

unset prompt
