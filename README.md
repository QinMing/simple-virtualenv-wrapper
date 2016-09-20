# Simple `virtualenv` wrapper

A single shell function that makes Python [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/) easier to use.

## Intro

Type `ve env_name` to get started. After you activate an environment for the first time, your env name is remembered. **Next time you can simply type `ve` in that folder to quickly activate the same virtual env. This also works in its sub-folders.**

Deactivate (exit): `ve -e`

List existing virtual environments: `ve -l`

Remove: `ve -d env_name`

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
# (Optional) Set the path to hold virtual environment data. If not set, it defaults to ~/virtualenvs.
VENV_ROOT=$HOME/<path to your virtualenv directory>

# Load the function
source $HOME/<path to ve.sh>
```

Example:

```sh
VENV_ROOT=$HOME/.myvirtualenvs  # optional
source $HOME/git/simple-virtualenv-wrapper/ve.sh
```

Compatible for Mac OS and Linux, as of now.
