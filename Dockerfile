FROM bioconductor/release_protmetcore2:R3.6.0_Bioc3.9

## https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html
ARG NB_USER=biouser
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

COPY . ${HOME}
WORKDIR ${HOME}
RUN ./prepare4binder.sh
RUN ./convertVignettes.sh

## Install dependencies for the vignettes:
RUN R -e 'BiocManager::install(c("xcms"), dependencies="Suggests")'
    
## Inherited Dockerfiles may unset the entrypoint 
USER USER ${NB_USER}
ENTRYPOINT []
