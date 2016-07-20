# Simple `virtualenv` wrapper

A single shell function that makes Python [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/) easier to use. I'm trying to keep this project as small as possible.

## Intro

Create new virtualenv: `ve new_env_name`

Activate: `ve env_name`. After you activate a venv once in a perticular folder, your venv name is remembered. Next time you can simply type `ve` in that folder to quickly activate the same venv.

Deactivate (exit): `ve -e`

List existing ones: `ve -l`

Remove: `ve -d new_env`

Help
```sh
~$ ve -h
Simple virtualenv wrapper for Python

Usage:
  ve [option] <name> [additional options]

Options:
  without option       Activate virtualenv, or create one if not exist.
                       Only when creating new environments, you can add
                       options that will be directed to virtualenv.
                       See `virtualenv -h` for more details.
  -d, --delete <name>  Delete a virtualenv.
  -e, --exit           Deactivate.
  -h, --help           Show this info.
  -l, --list           List existing virtualenvs (things in VENV_ROOT).
  --history            Edit (vim) the history file.
  -p, --root           Change the root path.
```

## Installation
1. Star this repo.
1. `git clone` this repo and add these two lines to your `.bash_profile` (Mac OS) or `.bashrc` (Linux).

```sh
VENV_ROOT=$HOME/<path to your virtualenv directory>
source $HOME/<path to ve.sh>
```

Example:

```sh
VENV_ROOT=$HOME/virens
source $HOME/git/simple-virtualenv-wrapper/ve.sh
```

Compatible for Mac OS and Linux, as of now.
