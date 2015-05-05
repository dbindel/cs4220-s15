LEC=\
	2015-01-21-quiz.md \
	2015-01-21-notes.pdf \
	2015-01-23-notes.pdf \
	2015-01-26-notes.pdf \
	2015-01-30-slides.pdf \
	2015-02-02-notes.pdf \
	2015-02-04-notes.pdf \
	2015-02-06-notes.pdf \
	2015-02-18-notes.pdf \
	2015-03-06-notes.pdf \
	2015-03-09-notes.pdf \
	2015-03-11-notes.pdf \
	2015-03-13-notes.pdf \
	2015-04-20-notes.pdf \
	review.pdf

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
