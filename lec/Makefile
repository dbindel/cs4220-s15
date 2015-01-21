LEC=\
	2015-01-21-quiz.md \
	2015-01-21-notes.pdf

.PHONY: all copy
all: $(LEC)
	
copy:
	mkdir -p ../web/lec
	cp $(LEC) ../web/lec

%.pdf: %.tex
	pdflatex $<
