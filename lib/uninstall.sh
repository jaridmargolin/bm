#!/bin/bash

# ##############################################################################
#
# bm uninstall
#
# ##############################################################################

# ------------------------------------------------------------------------------
# usage
# ------------------------------------------------------------------------------

function usage {
  echo "Usage: bm uninstall <name>"
  echo
  echo "Arguments"
  echo "  name"
  echo "    Name of package to uninstall"
}


# ------------------------------------------------------------------------------
# execute
# ------------------------------------------------------------------------------

if [[ "$1" = "-h" ]] || [[ "$1" = "--help" ]]; then
  usage; return
fi

PACKAGE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]:-${(%):-%x}}" )/../packages" > /dev/null && pwd )"

if rm "$PACKAGE_DIR/$1" > /dev/null 2>&1; then
  echo "✔︎ Changes will not reflect until new session opened"
else
  echo "✖ No package exists by the name: $1"
fi
