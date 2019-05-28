# ##############################################################################
#
# bm (bash_manager)
#
# Intended to reduce complexity of adding .dotfiles on a project by project
# basis, by symlinking project `_bash` directories to a bm managed directory.
# All symlinked directories are then recursively walked sourcing each *.sh file
# on the way.
#
# 1. Add {{BM_PATH}} to path
# 2. Alias `bm` to always run in current shell
# 3. Source all bm packages
#
# ##############################################################################

# ------------------------------------------------------------------------------
# SHARED
# ------------------------------------------------------------------------------

BM_PATH="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" > /dev/null && pwd -P)"


# # 1. Add {{BM_PATH}} to path
# # ===s
export PATH="${BM_PATH}/bin":$PATH


# 2. Alias `bm` to always run in current shell
# ===
alias bm='. bm'


# 3. Source all bm packages
# ===
CWD=$(pwd)
cd "${BM_PATH}/packages" > /dev/null
for f in $(find -L . -name "*.sh"); do [ -f $f ] && source "$f"; done
cd "$CWD" > /dev/null
