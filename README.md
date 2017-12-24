# Assembly Problems

Some problems solved in assembly Linux x64

## Requirements

```bash
yaourt -S yasm bash-bats
# or
apt-get install yasm bats
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
