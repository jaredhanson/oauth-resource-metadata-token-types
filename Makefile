OUTDIR ?= _site

all: $(OUTDIR) \
	$(OUTDIR)/latest.xml \
	$(OUTDIR)/latest.txt \
	$(OUTDIR)/latest.html

$(OUTDIR):
	git worktree add -B gh-pages $@ origin/gh-pages

$(OUTDIR)/%.xml: draft.md
	kramdown-rfc $< >$@

$(OUTDIR)/%.txt: $(OUTDIR)/%.xml
	xml2rfc $< -o $@ --text

$(OUTDIR)/%.html: $(OUTDIR)/%.xml
	xml2rfc $< -o $@ --html
