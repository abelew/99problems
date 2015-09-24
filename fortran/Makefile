BINDIR = bin

TARGET = %

FC=gfortran -std=f95 -Wall
SOURCES := $(wildcard *.f90)
OBJECTS := $(SOURCES:%.f90=%.mod)
rm = rm -f

list_test:	ll_data.f90 linked_list.f90 list_test.f90
	$(FC) $^ -o$@
01:	01.f90 linked_list.f90 ll_data.f90
	$(FC) $^ -o$@


%:	$(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET):	$(OBJECTS)
	@$(FC) -o $@ $(OBJECTS)
	@echo "Linking complete, test running $@"
	@$@
	@rm -f *.o

##$(OBJECTS):	$(BINDIR)/%.mod : %.f90
### $(eval) in this case makes a variable exe from basename of the target which includes the bin/
##	$(eval exe := $(basename $@ .o))
##	@echo "What is the exe: $(exe)"
### Here, we used $@ so the bin/ is gone
##	$(eval base := $(basename $< .o))
##	@echo "What is the base: $(base)"
##	@echo "Now compile the executable into bin/"
##	$(FC) -o$(exe) $<
##	@echo "Compiled "$<" successfully!"
##	@echo "Running $(exe)"
##	@$(exe)

.PHONEY: clean
clean:
	@$(rm) $(OBJECTS) *.o bin/*
	@echo "Cleanup complete!"

.PHONEY: remove
remove: clean
	@$(rm) $(BINDIR)/$(TARGET)
	@echo "Executable removed!"

