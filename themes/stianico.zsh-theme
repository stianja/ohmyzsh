# Prompt settings

GREEN=`echo '%{\033[32;1m%}'`
RED=`echo '%{\033[31;1m%}'`
BLUE=`echo '%{\033[34;1m%}'`
YELLOW=`echo '%{\033[1;33m%}'`
NORMAL=`echo '%{\033[00m%}'`

status () {
    if [ $? = "0" ]; then
        echo -ne $YELLOW'@'
    else
        echo -ne $RED'@'
    fi
    echo -ne $NORMAL
}


#USRCOL=$fg_bold[green]
if [ `id -u` = 0 ]
then
    USRICO=😈
    USRCOL=$RED
elif [ $USER = "mss" ]
then
    USRICO=🦩
    USRCOL=$GREEN
elif [ $USER = "stian" ]
then
    USRICO=🐑
    USRCOL=$GREEN
else
    USRCOL=$YELLOW
    USRICO=$USRCOL%n
fi


if [[ -n "$STY" ]]
then
    USRICO=📺$USRICO
fi


if [ "$SSH_TTY" = "" ]
then
    HOSTCOL=$YELLOW
    HOSTNAME=💻
else
    HOSTCOL=$RED
    HOSTNAME=%m
fi




#HOSTCOL=$GREEN


#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

#export PS1="$USRCOL%n$(status)$HOSTCOL%m$USRCOL [$(git_prompt_info)${BLUE}%~$USRCOL]> $NORMAL"
PROMPT="$USRICO$(status)$HOSTCOL$HOSTNAME$USRCOL [$BLUE%~$USRCOL]> $NORMAL"
