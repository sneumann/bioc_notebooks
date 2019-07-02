## Using Bioconductor Vignettes as Jupyter Notebooks

The Bioconductor project is [providing Docker containers](https://github.com/Bioconductor/bioc_docker) 
for a subset of the BiocView categories, containing a number of example
vignettes.

Here we use https://github.com/chronitis/ipyrmd to convert 
the vignettes to Jupyter Notebooks (`*.ipynb`). 

## Launching 

```
docker run --rm -it -p 8888:8888  jupyter  notebook xcms/xcms.ipynb --ip 0.0.0.0
```

## Building

Building the image can be done via:
```
docker build -t sneumann/bioc_notebooks_prebuilt:R3.6.0_Bioc3.9 .
```

Since this takes quite a while, running this `bioc_notebooks` github
repository on binder is not recommended. Instead, there is 
a minimal `Dockerfile` in https://github.com/sneumann/bioc_notebooks_prebuilt
which should be used as source repository for mybinder.org


