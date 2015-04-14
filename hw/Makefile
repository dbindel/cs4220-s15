PDFS=\
	ps1.pdf \
	ps2.pdf \
	ps3.pdf \
	ps5.pdf \
	ps6.pdf \
	ps7.pdf \
	proj1.pdf \
	proj2.pdf \
	proj3.pdf \
	proj1rev.pdf \
	mt-practice.pdf \
	mt-practices.pdf

.PHONY: all clean distclean copy
all: $(PDFS)

ps3.pdf: ps3.tex ps3pibad.m

clean:
	rm -f ps*.aux ps*.log ps*.out
	rm -f proj*.aux proj*.log proj*.out
	rm -f mt-practice.aux mt-practice.log mt-practice.out

distclean: clean
	rm -f ps*.pdf proj*.pdf mt-practice.pdf

copy: $(PDFS)
	mkdir -p ../web/hw
	cp $(PDFS) ../web/hw

%.pdf: %.tex
	pdflatex $<
	pdflatex $<
