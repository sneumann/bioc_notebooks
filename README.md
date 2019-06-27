## Using Bioconductor Vignettes as Jupyter Notebooks

The Bioconductor project is (providing Docker containers)[https://github.com/Bioconductor/bioc_docker] 
for a subset of the BiocView categories, containing a number of example
vignettes.

Here we use https://github.com/chronitis/ipyrmd to convert 
the vignettes to Jupyter Notebooks (*.ipynb).

## Launching 

```
docker run --rm -it -p 8888:8888 1856fd69ffe1 jupyter  notebook xcms/xcms.ipynb --ip 0.0.0.0
```
