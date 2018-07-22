#!/bin/bash
set -e

TESTDIR=tests
SRCDIR=src

function build_and_test() {
    echo "Compiling \"$1\"..."
    PROGRAM="$1" make

    echo "Running test for \"$1\"..." 
    bats "$TESTDIR/$1.bats"
}

make clean > /dev/null

for PROGRAM in $(ls -d src/*/ | cut -f2 -d'/')
do
    if [ $# -eq 1 ] && [ "$1" != "$PROGRAM" ]
    then
        continue
    fi

    build_and_test "$PROGRAM"
done

make clean > /dev/null