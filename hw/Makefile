PDFS=\
	ps1.pdf

.PHONY: all clean distclean copy
all: $(PDFS)

clean:
	rm -f ps*.aux ps*.log ps*.out

distclean: clean
	rm -f ps*.pdf

copy: $(PDFS)
	mkdir -p ../web/hw
	cp $(PDFS) ../web/hw

%.pdf: %.tex
	pdflatex $<
