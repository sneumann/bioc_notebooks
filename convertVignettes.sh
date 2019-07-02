#!/bin/bash 

## Convert Vignettes

for F in xcms msPurity MSnbase ; do 
  cp -ax /usr/local/lib/R/site-library/$F/doc $F
  (cd $F ; for G in *.Rmd ; do ipyrmd -o ${G%.Rmd}.ipynb $G ; done)
done 

