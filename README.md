# Simple `virtualenv` wrapper

A single shell function that makes Python [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/) easier to use. I'm trying to keep this project as small as possible.

## Intro

Create new virtualenv
```sh
# $ virtualenv ~/virens/new_venv
~$ ve new_env
virtualenv /Users/ming/virens/new_env new_env : Is this OK? (y/n)y
New python executable in /Users/ming/virens/new_env/bin/python
Installing setuptools, pip, wheel...done.
```
Activate or deactivate
```sh
# $ source ~/virens/new_venv/bin/activate
~$ ve new_env
# $ deactivate
(new_env) ~$ ve -e
~$
```
List existing ones
```sh
# $ ls  ~/virens/new_venv
~$ ve
env1 env2 new_env
```
Remove
```sh
~$ ve -d new_env
rm -r /Users/ming/virens/new_env : Is this OK? (y/n)y
~$
```
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
  -p, --root           Change the root path.
```

## Installation

`git clone` this repo and add these two lines to your `.bash_profile` (Mac OS) or `.bashrc` (Linux).

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
