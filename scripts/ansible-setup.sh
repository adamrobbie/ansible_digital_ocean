#!/bin/bash
# usage: source ./scripts/ansible-setup [-q]
#    modifies environment for running Ansible from checkout.
#    !!! This file is a modification of a script included with the ansible source. !!!

if [[ -z "$ANSIBLE_INSTALL_PATH" ]] ; then
  echo ""
  echo "Error: Set ANSIBLE_INSTALL_PATH when running this script. See README.md for details."
  echo ""
fi

if [[ -n "$ANSIBLE_INSTALL_PATH" ]] ; then
  HACKING_DIR="$ANSIBLE_INSTALL_PATH/hacking"

  FULL_PATH=`python -c "import os; print(os.path.realpath('$HACKING_DIR'))"`
  ANSIBLE_HOME=`dirname "$FULL_PATH"`

  PREFIX_PYTHONPATH="$ANSIBLE_HOME/lib"
  PREFIX_PATH="$ANSIBLE_HOME/bin"
  PREFIX_MANPATH="$ANSIBLE_HOME/docs/man"

  [[ $PYTHONPATH != ${PREFIX_PYTHONPATH}* ]] && export PYTHONPATH=$PREFIX_PYTHONPATH:$PYTHONPATH
  [[ $PATH != ${PREFIX_PATH}* ]] && export PATH=$PREFIX_PATH:$PATH
  unset ANSIBLE_LIBRARY
  export ANSIBLE_LIBRARY="$ANSIBLE_HOME/library:`python $HACKING_DIR/get_library.py`"
  [[ $MANPATH != ${PREFIX_MANPATH}* ]] && export MANPATH=$PREFIX_MANPATH:$MANPATH

  # Print out values unless -q is set

  if [ $# -eq 0 -o "$1" != "-q" ] ; then
      echo "Setting ansible variables ... done!"
      echo "You may place the following variables in your ~/.bashrc or ~/.profile to avoid having to re-run this script."
      echo ""
      echo "PATH=$PATH"
      echo "PYTHONPATH=$PYTHONPATH"
      echo "ANSIBLE_LIBRARY=$ANSIBLE_LIBRARY"
      echo "MANPATH=$MANPATH"
      echo ""
      echo ""
      echo "To test if ansible is setup, run: ansible --help"
  fi
fi
