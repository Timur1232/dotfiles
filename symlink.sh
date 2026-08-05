#!/usr/bin/env bash

set -euo pipefail

# For wildcards
shopt -s nullglob dotglob

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_NAME="$(basename "$0")"
EXCLUDE_FILES=("README.md" "$SCRIPT_NAME" ".config" ".git")

print_usage() {
    echo "\
DESCRIPTION: Symlink target config file or directory.

USAGE: ./symlink.sh [<targets-config>|all]

EXAMPLE:
    ./symlink.sh .config/nvim .tmux.conf

    ./symlink.sh all"
}

is_excluded() {
    file="$(basename "$1")"
    for excluded in "${EXCLUDE_FILES[@]}"; do
        if [ "$excluded" == "$file" ]; then
            return 0
        fi
    done
    return 1
}

deploy_config() {
    target="$1"

    if is_excluded "$target"; then
        return 0
    fi

    src="$SCRIPT_DIR/$target"
    dst="$HOME/$target"

    if ! [ -e "$src" ]; then
        echo "Config target $src not exists!"
        return 1
    elif [ -e "$dst" ]; then
        echo "Config target $dst already exists! Remove it or backup."
        return 1
    fi

    if ! ln -s "$src" "$dst"; then
        echo "Unable to symlink $target target!"
    else
        echo "Target $target deployed!"
    fi
}

all_good=true

if [ "$#" -eq 0 ]; then
    print_usage
    exit 1
elif [ "$1" == "all" ]; then
    if [ "$#" -gt 1 ]; then
        echo "Warning! Recieved command 'all', additional arguments will be ignored!"
    fi
    for file in * .config/*; do
        if ! deploy_config "$file"; then all_good=false; fi
    done
else
    for target in "$@"; do
        if ! deploy_config "$target"; then all_good=false; fi
    done
fi

echo
if [ "$all_good" == "true" ]; then
    echo "All targets deployed!"
else
    echo "Have some errors!"
fi
