OUTDIR ?= _site

all: $(OUTDIR) \
	$(OUTDIR)/index.xml \
	$(OUTDIR)/index.html \
	$(OUTDIR)/index.txt

$(OUTDIR):
	git worktree add -B gh-pages $@ origin/gh-pages

$(OUTDIR)/%.xml: draft.md
	kramdown-rfc $< >$@

$(OUTDIR)/%.html: $(OUTDIR)/%.xml
	xml2rfc $< -o $@ --html

$(OUTDIR)/%.txt: $(OUTDIR)/%.xml
	xml2rfc $< -o $@ --text
