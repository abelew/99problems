BINDIR = bin

GO=go run
SOURCES := $(wildcard *.go)
rm = rm -f

all:	01

%:	%.go

$(BINDIR)/$(TARGET):	$(SOURCES)
	@$(GO) $(SOURCES)

.PHONEY: clean
clean:
	@echo "Nothing to do."

.PHONEY: remove
remove: clean

