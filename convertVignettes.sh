#!/bin/bash 

## Convert Vignettes

for F in xcms msPurity MSnbase ; do 
  find /usr/local/lib/R/site-library/$F -name *.Rmd
done >/tmp/vignettes.files

for F in $(cat /tmp/vignettes.files) ; do 
  D="$(dirname $F | sed -e 's#/usr/local/lib/R/site-library/##' | sed -e 's#/doc#/#' )"
  E="$(basename $F | sed -e 's#.Rmd#.ipynb#')"
  
  mkdir -p "$D"
  ipyrmd -o "$D/$E" "$F"
done
