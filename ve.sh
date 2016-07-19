#!/bin/bash
#
# Copyright (c) 2016 Ming Qin (覃明) <https://github.com/QinMing>
# Open source under MIT LICENSE.
# You are more than welcome to come together and make this better.

function ve() {
  function get_storage_key() {
    echo "/User/qinming/a_path" | sed 's/_/__/g' | sed 's/\//_/g'
    return
  }

  # Change path here, or add it as environment variable
  if [ ! -n "$VENV_ROOT" ]; then
    local VENV_ROOT=$HOME/virtualenvs
  fi
  local HISTORY_FILE=$VENV_ROOT/.history

  if [ ! -f $HISTORY_FILE ]; then
    touch $HISTORY_FILE
  fi

  case "$1" in

    "")
      ttest=/Users/qinming/git/flaskfirst
      match=`cat $HISTORY_FILE | grep "$ttest:::"`
      echo $match
      return
      ;;

    -[lL]|--list)
      # echo `find $VENV_ROOT/* -maxdepth 0 -type d | xargs basename`
      # ls -d -1 $VENV_ROOT/* | xargs basename
      # echo ${PWD##*/}

      # The -F'/' sets the field separator to / which means that the last field, $NF, will be the file name.
      ls -1 $VENV_ROOT | awk -F'/' '{print $NF}'
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

    -[rR]|--root)
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
      echo "  -r, --root           Change the root path."
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
