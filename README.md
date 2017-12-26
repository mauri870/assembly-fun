# Assembly Problems

[![Build Status](https://travis-ci.org/mauri870/problems-assembly.svg?branch=master)](https://travis-ci.org/mauri870/problems-assembly)

Some problems solved in assembly Linux x64

## Requirements

```bash
yaourt -S yasm bash-bats
# or
sudo add-apt-repository ppa:duggan/bats
sudo apt-get update
sudo apt-get install make yasm bats
```

## Compilation

```bash
# The program is a subfolder in src/
PROGRAM=hello-world make
```

## Tests

```bash
./test_runner.sh
```
