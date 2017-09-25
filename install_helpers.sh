#!/usr/bin/env bash

###### CONFIG #######
BASE_URL="https://github.com/Eitol/pycharm_helpers/raw/master/"
EXTENSION=".tar.gz"
HELPER_FILE_NAME=$1${EXTENSION}
HELPER_REPO_URL=${BASE_URL}${HELPER_FILE_NAME}
HELPERS_PATH=~/.pycharm_helpers
HELPERS_LIST_FILE_NAME="VERSIONS.txt"
HELPERS_LIST="VOID"
##### END CONFIG ####

##### MISC #####
function print_red {
    echo -e "\e[31m$1"
}

function progress_filter {
    local flag=false c count cr=$'\r' nl=$'\n'
    while IFS='' read -d '' -rn 1 c
    do
        if $flag
        then
            printf '%c' "$c"
        else
            if [[ $c != $cr && $c != $nl ]]
            then
                count=0
            else
                ((count++))
                if ((count > 1))
                then
                    flag=true
                fi
            fi
        fi
    done
}
##### END MISC #####

##### FUNCTIONS #####
function print_available_helpers_version {
    if [ "${HELPERS_LIST}" == "VOID"  ] ; then
        wget -q ${BASE_URL}${HELPERS_LIST_FILE_NAME}
        HELPERS_LIST=$( cat ${HELPERS_LIST_FILE_NAME} )
        rm ./${HELPERS_LIST_FILE_NAME}
    fi
    echo "Available PyCharm helper versions:"
    echo ${HELPERS_LIST}
}

function prepare_helper_folder {
    # Create the helper path dir if not exist
    if [ ! -e ${HELPERS_PATH} ] ; then
        mkdir ${HELPERS_PATH}
    fi
}

function enter_in_helper_folder {
    cd ${HELPERS_PATH}
}

function get_helper_from_repo {
    # Get the .tar.gz from the repo
    wget --progress=bar:force ${HELPER_REPO_URL} 2>&1 | progress_filter

    if [ ! -e ${HELPER_FILE_NAME} ] ; then
        tput setaf 1
        print_red "ERROR: Helper with version $1 not found in destination repo"
        exit 1
    fi
}

function extract_helper {
    tar -xzf ./${HELPER_FILE_NAME} --strip 1
}
##### END FUNCTIONS #####

####### ROUTINE ########
prepare_helper_folder
enter_in_helper_folder
get_helper_from_repo
extract_helper
echo "FINISH :)"
###### END ROUTINE #####