FILES = $(wildcard *.tex)
PS = $(FILES:.tex=.ps)
PDF = $(FILES:.tex=.pdf)
DVI = $(FILES:.tex=.dvi)
BASE = $(firstword $(notdir $(basename $(FILES))))

all: $(PDF) 

%.pdf: %.tex 
	pdflatex --file-line-error-style $< </dev/null
	#uncomment for bibtex
#	bibtex $(basename $<)
	pdflatex --file-line-error-style $< </dev/null
	pdflatex --file-line-error-style $< </dev/null

clean: 
	rm -f *.out *.aux *.log
