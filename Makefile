# The temporary directory for object files
BUILD := build/

# The directory to store the compiled programs
BIN := bin/

# The location of the source files
SRC := src/

# The program to compile
PROGRAM ?= hello-world

# The source files for the program
SRCS = $(wildcard $(SRC)$(PROGRAM)/*.asm)

# Object files that will be generated
OBJS = $(addprefix $(BUILD), $(patsubst %.asm,%.o,$(SRCS:$(SRC)%=%)))

# Rule to debug variables
print-%  : ; @echo $* = $($*)

# Rule to link the object files into the final program
$(PROGRAM): $(OBJS) $(BIN)
	ld $(OBJS) -o $(BIN)$@

# Rule to generate the given object file
$(BUILD)%.o:
	mkdir -p $(dir $@)
	yasm -I $(SRC) -f elf64 -o $@ src/$*.asm

# Rule to create the binaries directory
$(BIN):
	mkdir -p $@

# Rule to clean intermediate object files and compiled programs
clean:
	-rm -r $(BUILD)
	-rm -r $(BIN)

test:
	./test_runner.sh $(TEST)
