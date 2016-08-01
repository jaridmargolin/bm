#!/bin/bash

# ##############################################################################
#
# install
#
# 1. Confirm bm not yet installed
# 2. Concat bootstrap template to end of ~/.bash_profile & ~/.bashrc files
# 3. Create packages directory
# 4. Source ~/.bash_profile
#
# ##############################################################################

# 1. Confirm bm not yet installed
# ===
# If `bm` exists then we must be operating within a shell that has bm/bin
# in the path. It is safe to say the only way this would occur is if the
# bootstrap template has already been added to ~/.bash_profile & ~/.bashrc
if type bm > /dev/null 2>&1; then
  echo "bm is already installed on the system"
  exit 0
fi


# 2. Concat bootstrap template to end of ~/.bash_profile & ~/.bashrc files
# ===
BM_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMPLATE=$( sed "s~{{BM_PATH}}~$BM_PATH~g" "$BM_PATH/templates/bootstrap" )

echo "$TEMPLATE" >> ~/.bash_profile
echo "$TEMPLATE" >> ~/.bashrc


# 3. Create packages directory
# ===
mkdir -p "$BM_PATH/packages"


# 4. Source ~/.bash_profile
# ===
source ~/.bash_profile
