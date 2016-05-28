# Simple `virtualenv` wrapper

A set of shell functions for activating Python [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/). I'm trying to keep this project as small as possible. 

Compatible for Mac OS and Linux, as of now.

## Intro

Create new virtualenv
```sh
~$ ve new_env
virtualenv /Users/ming/virtualenvs/new_env new_env : Is this OK? (y/n)y
New python executable in /Users/ming/virtualenvs/new_env/bin/python
Installing setuptools, pip, wheel...done.
```
Switch to a virtualenv
```sh
~$ ve new_env
(new_env) ~$ ve -e
```
List existing ones
```sh
(new_env) ~$ ve
env1 new_env
```
Deactivate
```sh
(new_env) ~$ ve -e
~$
```
Remove
```sh
~$ ve -d new_env
rm -r /Users/ming/virtualenvs//new_env : Is this OK? (y/n)y
~$ ve
env1
```
Help
```sh
~$ ve -h
Simple virtualenv wrapper for Python

Usage:
  ve [option] <name> [additional options]

Options:
  without option       Activate virtualenv, or create one if doesn't exist.
                       Only when creating new environments, you can add
                       options that will be passed to virtualenv.
                       See `virtualenv -h`
  -d, --delete <name>  Delete a virtualenv.
  -e, --exit           Deactivate.
  -h, --help           Show this info.
  -l, --list           List existing virtualenvs (things in VENV_ROOT).
  -p, --root           Change the root path.

Additional Options
  be passed to virtualenv. Please see `virtualenv -h` for details

```

## Installation

`git clone` this repo, and add these two lines to your `.bash_profile` (Mac OS) or `.bashrc` (Linux).

```sh
VENV_ROOT=$HOME/<path to your virtualenv directory>
source $HOME/<path to ve.sh>
```

Example:

```sh
VENV_ROOT=$HOME/virtualenvs
source $HOME/git/simple-virtualenv-wrapper/ve.sh
```
