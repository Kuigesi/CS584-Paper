SHELL=/bin/sh
THESIS=paper

.SUFFIXES:
.SUFFIXES: .bib .pdf .tex

all: $(THESIS).pdf

$(THESIS).pdf: $(THESIS).bbl $(THESIS).tex
	pdflatex $(THESIS).tex -draftmode
	pdflatex $(THESIS).tex

$(THESIS).bbl: $(THESIS).aux
	bibtex $(THESIS).aux

$(THESIS).aux: $(THESIS).bib
	pdflatex $(THESIS).tex -draftmode
	pdflatex $(THESIS).tex -draftmode


clean:
	rm -rf build
	$(RM) *.log *.aux *.out *.bbl *.blg *.cut *.fdb_latexmk *.fls *.gz *.pdf


.PHONY: all clean
