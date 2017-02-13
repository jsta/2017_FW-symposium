all: 2017_FW-symposium_stachelek.pdf
	echo done

2017_FW-symposium_stachelek.pdf:	main.pdf closing.pdf images/nutrientmontage.png
	pdftk main.pdf closing.pdf cat output 2017_FW-symposium_stachelek.pdf

main.pdf:		main.Rmd images/nutrientmontage.png
			Rscript -e "rmarkdown::render('$<', clean=TRUE)"
			
closing.pdf: closing.tex
	pdflatex closing.tex
	
clean:
	-rm *.pdf
	-rm *.nav *.log *.aux *.out *.snm *.toc
	
images/nutrientmontage.png:
	montage -geometry +2+2 -tile 4x1 -bordercolor black -border 2 images/UpperFallsHMPP.jpg images/mining.png images/crops.png images/city.png images/nutrientmontage.png

