FROM qnib/uplain-easybuild

RUN apt-get install -y libibverbs-dev
ARG JVER=jdk-8u162-linux-x64
RUN mkdir -p ${PYTHONPATH}/easybuild_easyconfigs-3.6.0-py2.7.egg/easybuild/easyconfigs/j/Java/j/Java/ \
 && cd ${PYTHONPATH}/easybuild_easyconfigs-3.6.0-py2.7.egg/easybuild/easyconfigs/j/Java/j/Java/ \
 && wget -q http://ftp.osuosl.org/pub/funtoo/distfiles/oracle-java/${JVER}.tar.gz
USER user
RUN eb Keras-2.1.3-foss-2017b-Python-3.6.3.eb --robot
