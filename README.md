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

    $ workon [environment] [python version]

If *environment* is not provided, then the list of existing venvs
will be printed instead.

## Choosing the python version
The python you want to use must exist in the `$PATH` and start with
`python`. Pass the version suffix of the executable as the second
argument to the script. It'll be translated like so when creating
the venv:

```
workon foo 3.6 => python3.6 -m venv $WORKON_HOME/foo
```

## Where venvs are created
When `workon` is called, venvs are created or loaded from the
`$HOME/.venv` folder by default.
To change this behavior, set the `WORKON_HOME` environment
variable before sourcing `venvworkon.sh`.

## Post-activate script
If the file `$HOME/.venvs/<venv>/postactivate.sh` exists, it is
automatically sourced after the venv is activated. This is useful
to export environment variable such as `DJANGO_SETTINGS_MODULE`.

## Project directory
If `PROJECT_HOME` is set (e.g. `$HOME/Projects`) and there is
a project folder which match the environment name, venvworkon
change the current working directory to the project directory.

## DotEnv support
If the script is able to find the path to your project, and
a `.env` file exists at the root of your project, then it
will be sourced automatically when activating the environment.

For the _venvworkon_ to find the path of the project, it
either needs to be created through the shorthand `.` name, or
you need to have `PROJECT_HOME` set and your environment
name must match your project directory's name.

## Why bother using this
`virtualenvwrapper` is certainly much more feature-packed and
useful than this. But this wrapper is handy for development and
uses the light-weight `pyvenv` rather than virtualenv. Up to you.
