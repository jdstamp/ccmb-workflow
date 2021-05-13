#!/bin/bash

cd "${PACKAGE_DIR}" || exit # exit if 'cd ...' fails
git fetch --prune && git reset --hard origin/"${DEV_BRANCH}"
Rscript -e "install.packages('.', repos = NULL, type = 'source')"
