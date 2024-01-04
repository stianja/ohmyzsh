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


if [ `id -u` = 0 ]
then
    USRCOL=$RED
else
    USRCOL=$GREEN
fi

if [ "$SSH_TTY" = "" ]
then
    HOSTCOL=$YELLOW
else
    HOSTCOL=$RED
fi


#export PS1="$GREEN%n@%m [$BLUE%~$GREEN]> $NORMAL"
export PS1="$USRCOL%n$(status)$HOSTCOL%m$USRCOL [$BLUE%~$USRCOL]> $NORMAL"
#export RPS1="$BLUE%T$NORMAL"
