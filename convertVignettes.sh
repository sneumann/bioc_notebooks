#!/bin/bash 

## https://github.com/chronitis/ipyrmd
pip install ipyrmd

## Convert Vignettes
pip install pathlib

ipyrmd -o xcms.ipynb /usr/local/lib/R/site-library/xcms/doc/xcms.Rmd
