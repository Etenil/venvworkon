VENV WORKON
===========

A very simple wrapper around python3's venv. This little script
allows creating and using venvs well tucked away from your project
code.

## Install
Put the `venvworkon.sh` script somewhere and source it in your
`~/.profile` or `~/.bashrc` file.

## Usage
The script only supports one usage mode:

    $ workon [environment]

If *environment* is not provided, then the list of existing venvs
will be printed instead.

## Where venvs are created
When `workon` is called, venvs are created or loaded from the
`$HOME/.venvs` folder by default.
To change this behavior, set the `WORKON_HOME` environment
variable before sourcing `venvworkon.sh`.

## Post-load script
If the file `$HOME/.venvs/<venv>/postload.sh` exists, it is
automatically sourced after the venv is loaded. This is useful
to export environment variable such as `DJANGO_SETTINGS_MODULE`.

## Why bother using this
`virtualenvwrapper` is certainly much more feature-packed and
useful than this. But this wrapper is handy for development and
uses the light-weight `pyvenv` rather than virtualenv. Up to you.
