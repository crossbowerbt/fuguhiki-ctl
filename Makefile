BINS = fuguhiki-ctl fuguhiki-firefox-ctl

PREFIX ?= /usr/local/

all:
	echo "nothing to do for all..."

install:
	install -D $(BINS) $(PREFIX)/bin/

uninstall:
	cd $(PREFIX)/bin/
	rm -f $(BINS)

