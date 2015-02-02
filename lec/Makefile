LEC=\
	2015-01-21-quiz.md \
	2015-01-21-notes.pdf \
	2015-01-23-notes.pdf \
	2015-01-26-notes.pdf \
	2015-01-30-slides.pdf \
	2015-02-02-notes.pdf \
	2015-02-04-notes.pdf 

.PHONY: all copy
all: $(LEC)

clean:
	rm -f *.aux *.log *.out

distclean: clean
	rm -f *.pdf

copy:
	mkdir -p ../web/lec
	cp $(LEC) ../web/lec

%.pdf: %.tex
	pdflatex $<
	pdflatex $<

2015-01-23-notes.pdf: 2015-01-23-notes.tex 2015-01-23-codes/newtong.dat

2015-01-23-codes/newtong.dat: 2015-01-23-codes/newtong.m
	(cd 2015-01-23-codes ; octave newtong.m)
