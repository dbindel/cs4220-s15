PDFS=\
	ps1.pdf \
	ps2.pdf \
	ps3.pdf \
	ps5.pdf \
	proj1.pdf

.PHONY: all clean distclean copy
all: $(PDFS)

ps3.pdf: ps3.tex ps3pibad.m

clean:
	rm -f ps*.aux ps*.log ps*.out
	rm -f proj*.aux proj*.log proj*.out

distclean: clean
	rm -f ps*.pdf

copy: $(PDFS)
	mkdir -p ../web/hw
	cp $(PDFS) ../web/hw

%.pdf: %.tex
	pdflatex $<
