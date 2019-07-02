#!/bin/sh

## https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html
pip install --no-cache-dir notebook==5.*

## https://github.com/chronitis/ipyrmd
pip install ipyrmd
pip install pathlib
pip install runipy

## It must set up a user whose uid is 1000. on binder we do not allow root container processes.
## 
deluser `id -un ${NB_UID}` || /bin/true

adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

## Install R Kernel:
R -e "install.packages('IRkernel')"
R -e "IRkernel::installspec(user = FALSE)"

# Make sure the contents of our repo are in ${HOME}
chown -R ${NB_UID} ${HOME}
