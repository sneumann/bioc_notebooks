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

## Install dependencies for the vignettes:
#RUN R -e 'BiocManager::install(c("xcms"), dependencies=T)'
RUN R -e 'BiocManager::install(c("msPurity", "xcms", "MSnbase"), dependencies=T)'
    
## Inherited Dockerfiles may unset the entrypoint 
RUN ./convertVignettes.sh
RUN chown -R ${NB_USER} /home/${NB_USER}
USER ${NB_USER}
ENTRYPOINT []
