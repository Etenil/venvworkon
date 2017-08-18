workon() {
    # Sets WORKON_HOME to default if not set already
    if [ -z $WORKON_HOME ]; then
        WORKON_HOME="$HOME/.venv"
    fi

    # Creates WORKON_HOME directory if not exists
    if [ ! -e $WORKON_HOME ]; then
        mkdir -p $WORKON_HOME
        echo "Virtual env directory created in $WORKON_HOME"
    fi

    # Quit if there is no arguments, while showing available venvs
    if [ "$#" -lt "1" ]; then
        ls "$WORKON_HOME" 
        return
    fi

    envdir="$WORKON_HOME/$1"

    if [ "$1" == "." ]; then
        target=$(basename `pwd`)
        envdir="$WORKON_HOME/$target"
    fi

    # Creates virtual env if doesn't exists
    if [ ! -e "$envdir" ]; then
        python3 -m venv $envdir
        echo "Virtual env created in $envdir"
    fi

    source "$envdir/bin/activate"
    unset envdir  # VIRTUAL_ENV is now set by bin/activate

    # Jumps to project directory if exists and PROJECT_HOME is set
    if [ -d "$PROJECT_HOME/$(basename $VIRTUAL_ENV)" ]; then
        cd "$PROJECT_HOME/$(basename $VIRTUAL_ENV)"
    fi

    # Source postactivate.sh if exists in the virtual env
    if [ -e "$VIRTUAL_ENV/postactivate.sh" ]; then
        source "$VIRTUAL_ENV/postactivate.sh"
    fi
}
