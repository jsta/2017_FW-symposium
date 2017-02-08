
sources := 		$(wildcard *.Rmd)
slides := 		$(sources:.Rmd=.pdf)

all:			${slides} closing
	pdftk $(shell ls *.pdf) cat output out.pdf

%.pdf:			%.Rmd nutfig
			Rscript -e "rmarkdown::render(\"$<\", clean=TRUE)"
			
closing: closing.tex
	pdflatex closing.tex
	
clean:
	-rm out.pdf
	-rm *.nav *.log *.aux *.out *.snm *.toc
	
nutfig:
	montage -geometry +2+2 images/cows.png images/crops.png images/city.png images/nutrientmontage.png

