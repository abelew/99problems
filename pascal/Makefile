BINDIR = bin

TARGET = %

PC=/usr/bin/pc -Tlinux
SOURCES := $(wildcard *.p)
OBJECTS := $(SOURCES:%.p=$(BINDIR)/%.o)
rm = rm -f

%:	$(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET):	$(OBJECTS)
	@$(PC) -o $@ $(OBJECTS)
	@echo "Linking complete, test running $@"
	@$@
	@rm -f *.o

$(OBJECTS):	$(BINDIR)/%.o : %.p
# $(eval) in this case makes a variable exe from basename of the target which includes the bin/
	$(eval exe := $(basename $@ .o))
	@echo "What is the exe: $(exe)"
# Here, we used $@ so the bin/ is gone
	$(eval base := $(basename $< .o))
	@echo "What is the base: $(base)"
# Finally, we can use a string substitution of the existing variable to make a .hs into a .hi -- or in this case a nothing into nothing.hi
	@echo "Now compile the executable into bin/"
	$(PC) -o$(exe) $<
	@echo "Compiled "$<" successfully!"
	@echo "Linking appears to be done by the pascal compiler."
	@echo "Running $(exe)"
	@$(exe)

.PHONEY: clean
clean:
	@$(rm) $(OBJECTS) *.o bin/*
	@echo "Cleanup complete!"

.PHONEY: remove
remove: clean
	@$(rm) $(BINDIR)/$(TARGET)
	@echo "Executable removed!"

