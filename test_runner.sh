#!/bin/bash

TESTDIR=tests
SRCDIR=src

make clean > /dev/null

for DIR in $(ls -d $SRCDIR/*/)
do
    PROGRAM=$(basename "$DIR")
    echo "Compiling $PROGRAM..."
    PROGRAM="$PROGRAM" make

    echo "Running test for $PROGRAM..." 
    PATH="$(pwd)/bin:$PATH" bats "$TESTDIR/$PROGRAM.bats"
done