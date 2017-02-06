
sources := 		$(wildcard *.Rmd)
slides := 		$(sources:.Rmd=.pdf)

all:			${slides} closing
	pdftk $(shell ls *.pdf) cat output out.pdf

%.pdf:			%.Rmd
			Rscript -e "rmarkdown::render(\"$<\", clean=TRUE)"
			
closing: closing.tex
	pdflatex closing.tex
	
clean:
	rm out.pdf
	rm *.nav *.log *.aux *.out
	


