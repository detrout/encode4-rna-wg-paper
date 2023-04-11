
SLIDES = 

PDFS = 	 

NOTEBOOKS = count-replicates.html \
            stage-data-for-paper.html \


ORG = README.html

all: $(SLIDES) $(NOTEBOOKS) $(PDFS) $(ORG)

%.slides.html:%.ipynb Makefile
	jupyter nbconvert --to slides $<

%.html:%.ipynb Makefile
	jupyter nbconvert --to html $<

%.pdf:%.ipynb Makefile
	jupyter nbconvert --to pdf $<

%.html:%.org Makefile
	emacs $< --batch -f org-html-export-to-html --kill

clean:
	rm $(SLIDES) $(NOTEBOOKS) $(PDFS) $(ORG)
