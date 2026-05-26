PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
DESTDIR ?=

.PHONY: all install uninstall

all:
	@echo "Nothing to build. Only installation."

install:
	install -d $(DESTDIR)$(BINDIR)
	install -m 755 galert $(DESTDIR)$(BINDIR)/galert

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/galert
