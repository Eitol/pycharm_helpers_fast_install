#!/usr/bin/env bash

BASE_URL="https://github.com/Eitol/pycharm_helpers/raw/master/"
EXTENSION=".tar.gz"
HELPER_REPO_URL=${BASE_URL}$1${EXTENSION}
HELPERS_PATH=~/.pycharm_helpers

# Create the helper path dir if not exist
if [ ! -e ${HELPERS_PATH} ] ; then
    mkdir ${HELPERS_PATH}
fi


cd HELPERS_PATH

#wget ${PHELPER_URL}
