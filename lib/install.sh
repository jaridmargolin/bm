#!/bin/bash

# ##############################################################################
#
# bm install
#
# ##############################################################################

# ------------------------------------------------------------------------------
# usage
# ------------------------------------------------------------------------------

function usage {
  echo "Usage: bm install [--options]"
  echo
  echo "Options"
  echo "  -d, --dir"
  echo "    Directory containg scripts to install. This directory will be"
  echo "    symlinked into the .bm/packages. By default the value of the"
  echo "    directory utilized is  \`./_bash\` (relative to cwd)."
  echo
  echo "  -n, --name"
  echo "    Name to install the directory as. This will be the name used to"
  echo "    reference the scripts in all future operations. By default the"
  echo "    value used will be the basename of the cwd."
}


# ------------------------------------------------------------------------------
# execute
# ------------------------------------------------------------------------------

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  usage; return
fi

DIR="_bash"
NAME="$( basename `pwd` )"

while [[ $# -gt 1 ]]; do
  case "$1" in
    -d|--dir) DIR="$2"; shift;;
    -n|--name) NAME="$2"; shift;;
  esac
  shift
done

PACKAGE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../packages" > /dev/null && pwd )"
DIR="$( cd "$DIR" > /dev/null 2>&1 && pwd )"

if ln -s "$DIR" "$PACKAGE_DIR/$NAME" > /dev/null 2>&1; then
  echo "✔︎ Package installed as: $NAME"
  source ~/.bash_profile
else
  echo "✖ Unable to install package: $NAME"
fi
