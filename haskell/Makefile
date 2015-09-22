BINDIR = bin

TARGET = %

SOURCES := $(wildcard *.hs)
OBJECTS := $(SOURCES:%.hs=$(BINDIR)/%.o)
rm = rm -f

%:	$(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET):	$(OBJECTS)
	@ghc -o $@ $(OBJECTS)
	@echo "Linking complete, test running $@"
	@$@
	@rm -f *.hi *.o

$(OBJECTS):	$(BINDIR)/%.o : %.hs
# $(eval) in this case makes a variable exe from basename of the target which includes the bin/
	$(eval exe := $(basename $@ .o))
	@echo "What is the exe: $(exe)"
# Here, we used $@ so the bin/ is gone
	$(eval base := $(basename $< .o))
	@echo "What is the base: $(base)"
# Finally, we can use a string substitution of the existing variable to make a .hs into a .hi -- or in this case a nothing into nothing.hi
	$(eval hi := ${base:=.hi})
	@echo "What is the hi file: $(hi)"
	@echo "Now compile the executable into bin/"
	@ghc -c $< -o $@
	@echo "Compiled "$<" successfully!"
	@echo "Removing $(hi)"
	@$(rm) $(hi)
	@echo "Linking (this step really is not needed) $@"
	ghc -o $(exe) $@
	@echo "Running $(exe)"
	@$(exe)

.PHONEY: clean
clean:
	@$(rm) $(OBJECTS) *.hi *.o bin/*
	@echo "Cleanup complete!"

.PHONEY: remove
remove: clean
	@$(rm) $(BINDIR)/$(TARGET)
	@echo "Executable removed!"

