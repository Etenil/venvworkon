workon() {
    # Sets WORKON_HOME to default if not set already
    test -z "$WORKON_HOME" && WORKON_HOME="$HOME/.venv"

    # Creates WORKON_HOME directory if not exists
    test ! -e "$WORKON_HOME" && mkdir -p $_

    # Quit if there is no arguments, while showing available venvs
    test "$#" -lt "1" && ls "$WORKON_HOME"; return

    envdir="$WORKON_HOME/$1"

    # Creates virtual env if doesn't exists
    test ! -e "$envdir" && pyvenv $_ && echo "Virtual env created in $_"

    source "$envdir/bin/activate"
    unset envdir  # VIRTUAL_ENV is now set by bin/activate

    # Jumps to project directory if exists and PROJECT_HOME is set
    test -d "$PROJECT_HOME/$(basename $VIRTUAL_ENV)" && cd $_

    # Source postactivate.sh if exists in the virtual env
    test -e "$VIRTUAL_ENV/postactivate.sh" && source $_
}
