#!/bin/bash

set -e

VENVS_PATH=./venvs

function setup_python_env() {
    reqs=$1     # boolean
    venvName=$2 # string
    rootName=$3 # string
    cd $VENVS_PATH
    python -m venv --clear $venvName
    source ./$venvName/bin/activate
    cd ../$rootName
    if $reqs
    then
        pip install -r requirements.txt
    else
        pip install .
    fi
    deactivate
    cd ..
}

setup_python_env true "venv_common" "shared_lib"
