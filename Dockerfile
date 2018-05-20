ARG FROM_IMG_NAME=uplain-easybuild
ARG FROM_IMG_TAG=latest
ARG DOCKER_REPO=qnib
ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${DOCKER_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

ARG EB_PKG=Keras-2.1.3-foss-2017b-Python-3.6.3.eb
USER root
RUN apt-get install -y libibverbs-dev
ARG JVER=jdk-8u162-linux-x64
RUN mkdir -p ${PYTHONPATH}/easybuild_easyconfigs-3.6.0-py2.7.egg/easybuild/easyconfigs/j/Java/j/Java/ \
 && cd ${PYTHONPATH}/easybuild_easyconfigs-3.6.0-py2.7.egg/easybuild/easyconfigs/j/Java/j/Java/ \
 && wget -q http://ftp.osuosl.org/pub/funtoo/distfiles/oracle-java/${JVER}.tar.gz
USER user
RUN eb --dry-run-short ${EB_PKG} --robot \
 && eb ${EB_PKG} --robot
