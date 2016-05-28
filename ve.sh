#!/bin/bash
#
# Copyright (c) 2016 Ming Qin (覃明) <https://github.com/QinMing>
# Open source under MIT LICENSE.
# You are more than welcome to come together and make this better.

function ve() {
  case "$1" in
    -[lL]|--list|"")
      echo `find $VENV_ROOT/* -maxdepth 0 -type d | xargs basename`
      return
      ;;

    -[dD]|--delete)
      read -p "rm -r $VENV_ROOT/$2 : Is this OK? (y/n)" -n 1 -r
      echo
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
        rm -r $VENV_ROOT/$2
      fi
      return
      ;;

    -[pP]|--root)
      echo "not implemented yet"
      return
      ;;

    -[eE]|--exit)
      deactivate
      return
      ;;

    -*)
      echo "Simple virtualenv wrapper for Python"
      echo
      echo "Usage:"
      echo "  ve [option] <name> [additional options]"
      echo
      echo "Options:"
      echo "  without option       Activate virtualenv, or create one if doesn't exist."
      echo "                       Only when creating new environments, you can add"
      echo "                       options that will be passed to virtualenv."
      echo "                       See \`virtualenv -h\`"
      echo "  -d, --delete <name>  Delete a virtualenv."
      echo "  -e, --exit           Deactivate."
      echo "  -h, --help           Show this info."
      echo "  -l, --list           List existing virtualenvs (things in VENV_ROOT)."
      echo "  -p, --root           Change the root path."
      echo
      echo "Additional Options"
      echo "  be passed to virtualenv. Please see \`virtualenv -h\` for details"
      return
      ;;

    *)
      local VENV_PATH=$VENV_ROOT/$1
      local actv=$VENV_PATH/bin/activate
      if [ ! -s $actv ]; then  # virtualenv doesn't exist, let's create one
        read -p "virtualenv $VENV_PATH $* : Is this OK? (y/n)" -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
          shift 1
          virtualenv $VENV_PATH $*
        fi
      fi
      source $actv
      return
      ;;
  esac
}
