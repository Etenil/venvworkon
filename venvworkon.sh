workon() {
    envroot="$HOME/.venv"

    if [ ! -e "$envroot" ]
    then
        mkdir -p "$envroot"
    fi

    if [ "$#" -lt "1" ]
    then
        ls "$envroot"
        return
    fi

    envname=$1

    envdir="$envroot/$envname"

    if [ ! -e "$envdir" ]
    then
        pyvenv "$envdir"
    fi

    source "$envdir/bin/activate"

    if [ -e "$envdir/postload.sh" ]
    then
        source "$envdir/postload.sh"
    fi
}
