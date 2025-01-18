MANDIR=/usr/local/share/man

.PHONY: manpages
manpages:
	mkdir -p bin/manpages
	for page in $$(find . -ipath '*.scd'); do \
		scdoc < $$page > bin/$${page%.scd}; \
	done

.PHONY: install
install: manpages
	mkdir -p $(MANDIR)/man1
	install -m644 bin/manpages/hire.cafe.1 $(MANDIR)/man1
