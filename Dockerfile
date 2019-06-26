FROM bioconductor/release_protmetcore2:R3.6.0_Bioc3.9

## https://github.com/chronitis/ipyrmd
RUN pip install ipyrmd

## https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html
RUN pip install --no-cache-dir notebook==5.*

#It must set up a user whose uid is 1000. on binder we do not allow root container processes.
ARG NB_USER=biouser
ARG NB_UID=10000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN R -e "install.packages('IRkernel')"
RUN R -e "IRkernel::installspec(user = FALSE)"
    
# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

## Convert Vignettes
RUN pip install pathlib
WORKDIR /tmp
RUN ipyrmd -o xcms.ipynb /usr/local/lib/R/site-library/xcms/doc/xcms.Rmd


## Inherited Dockerfiles may unset the entrypoint 
ENTRYPOINT []
