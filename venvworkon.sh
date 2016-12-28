workon() {
    if [ -z "$WORKON_HOME" ]
    then
        WORKON_HOME="$HOME/.venv"
    fi

    if [ ! -e "$WORKON_HOME" ]
    then
        mkdir -p "$WORKON_HOME"
    fi

    if [ "$#" -lt "1" ]
    then
        ls "$WORKON_HOME"
        return
    fi

    envname=$1

    envdir="$WORKON_HOME/$envname"

    if [ ! -e "$envdir" ]
    then
        pyvenv "$envdir"
    fi

    source "$envdir/bin/activate"

    if [ -d "$PROJECT_HOME/$envname" ]
    then
        cd "$PROJECT_HOME/$envname"
    fi

    if [ -e "$envdir/postactivate.sh" ]
    then
        source "$envdir/postactivate.sh"
    fi
}
