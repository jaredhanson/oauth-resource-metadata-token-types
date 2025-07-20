OUTDIR ?= _site

all: $(OUTDIR) draft.xml draft.txt draft.html

$(OUTDIR):
	git worktree add -B gh-pages $@ origin/gh-pages

%.xml: %.md
	kramdown-rfc $< >$@

%.txt: %.xml
	xml2rfc $< -o $@ --text

%.html: %.xml
	xml2rfc $< -o $@ --html
