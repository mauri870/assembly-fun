# Assembly Problems

[![Build Status](https://travis-ci.org/mauri870/assembly-fun.svg?branch=master)](https://travis-ci.org/mauri870/assembly-fun)

Some fun in assembly Linux x64

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
PROGRAM=yes make
./bin/yes | pv -r > /dev/null
[5,85GiB/s]

# Same performance as GNU yes on my machine ;)
yes | pv -r > /dev/null
[5,81GiB/s]
```

## Tests

```bash
./test_runner.sh
```

## Docker

```bash
docker build -t problems-assembly .
docker run -it --rm -v $(pwd):/var/data -w /var/data problems-assembly bash
```
