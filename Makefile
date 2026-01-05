.PHONY: all clean

MAIN = main
LATEX = pdflatex
BIBTEX = bibtex
FLAGS = -interaction=nonstopmode -halt-on-error

all: $(MAIN).pdf

$(MAIN).pdf:
	$(LATEX) $(FLAGS) $(MAIN).tex
	for CHAP in $(chap*); do \
		$(BIBTEX) $${CHAP}/main; \
	done
	$(LATEX) $(FLAGS) $(MAIN).tex
	$(LATEX) $(FLAGS) $(MAIN).tex

clean:
	rm -f $(MAIN).pdf $(MAIN).aux $(MAIN).bbl $(MAIN).blg $(MAIN).log $(MAIN).out $(MAIN).toc $(MAIN).lof $(MAIN).lot
	for CHAP in $(chap*); do \
		rm -f $${CHAP}/main.aux $${CHAP}/main.bbl $${CHAP}/main.blg $${CHAP}/main.log; \
	done
