#!/usr/bin/bash
# setup script for the project

# vars
VENV_PATH=".venv"
PYPROJECT_FILE="pyproject.toml"

# package install function
install_modules() {
    # checking to see if pyproject exists
    if [[ -f "$PYPROJECT_FILE" ]]; then
        echo "pyproject exists, installing packages now"
        pip install -e .
    else
        echo "pyproject doesn't exist, please create one or download from the repo"
        exit
    fi

}

# checking to see if it exists before we create a new one
if [[ -d "$VENV_PATH" ]]; then
    echo "venv exists, moving on to installing packages"
    install_modules
else
    echo "venv does not exist, creating one now."
    python3 -m venv venv
    echo "installing packages..."
    install_modules
fi