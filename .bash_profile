#######################
# ##### GENERAL ##### #
#######################
source ~/.bashrc

if [ -f $HOME/.git-prompt.sh ]; then
    source $HOME/.git-prompt.sh
fi

if [ -d $HOME/usr/perl5 ]; then
    PERL5LIB=$PERL5LIB:$HOME/usr/perl5/lib/perl5/
fi

if [ -d $HOME/perl5 ]; then
    PERL5LIB=$PERL5LIB:$HOME/perl5/lib/perl5/
fi

export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"
export PERL5LIB=$PERL5LIB:$HOME/software/msparser/perl512

if [ -d $HOME/.rbenv ]; then
    PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if [ -d $HOME/usr/python_virtualenv/bin ]; then
	export VIRTUAL_ENV_DISABLE_PROMPT=0
	source $HOME/usr/python_virtualenv/bin/activate
fi

if [ -d $HOME/usr/python ]; then
    export PYTHONPATH=$HOME/usr/python
    PATH=$PYTHONPATH:$PATH
fi

#####################################
# ##### ENVIRONMENT VARIABLES ##### #
#####################################
export GZIP="-9"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;35"

export CLICOLOR=true
export PAGER=less
export LESS="-eRX"
export EDITOR=vim

export HISTIGNORE="&:cd:[bf]g:x:c:vib:w:qsc:resource:..:l:ll:ls:llr"
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:  "

export PROMPT_COMMAND='history -a'
export PROMPT_DIRTRIM=4

export MAKEFLAGS='-j4'

if [[ $HOSTNAME == patsalo* ]]; then
    PATH=$HOME/bin:$HOME/usr/local/bin:/sbin:/usr/sbin:/usr/texbin:$PATH
    PATH=/opt/local/libexec/gnubin:/opt/local/libexec/perl5.12:$PATH
    PATH=/opt/local/bin:/opt/local/sbin:$PATH
    PATH=/usr/local/git/bin:$PATH
    PATH=$HOME/perl5/bin:$PATH
fi

if [[ $HOSTNAME == garibaldi* || $HOSTNAME == hpc* ]]; then
    export MASSACRE_PATH=$HOME/software/massacre_devel
    PATH=$PATH:/gpfs/group/williamson/bin
    PATH=$HOME/usr/local/bin:$PATH
    PATH=$PATH:$HOME/usr/local/wx/2.8/bin
    PATH=$PATH:$MASSACRE_PATH/bin
    PATH=$PATH:$HOME/perl5/bin

    #module load fftw
    #module load massacre
    #module load python
    #module load python-addons
    #module load R
fi

MANPATH=$MANPATH:$HOME/usr/local/man
MANPATH=$MANPATH:$HOME/usr/local/share/man
MANPATH=$MANPATH:$HOME/perl5/man

export MANPATH
export PATH
