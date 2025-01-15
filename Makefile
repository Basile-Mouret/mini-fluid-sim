# Compiler
FC = gfortran

# Compiler flags
FFLAGS = -O2 -Wall

# Source files
SRC = $(wildcard *.f90)

# Object files
OBJ = $(SRC:.f90=.o)

# Executable name
EXEC = my_program

# Default target
all: $(EXEC)

# Link object files to create the executable
$(EXEC): $(OBJ)
	$(FC) $(FFLAGS) -o $@ $^

# Compile source files to object files
%.o: %.f90
	$(FC) $(FFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(OBJ) $(EXEC)

.PHONY: all clean