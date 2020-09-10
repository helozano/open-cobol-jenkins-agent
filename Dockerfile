FROM openshift/jenkins-slave-base-centos7


ARG OC_VERSION=2.2
ARG BASE_URL=http://ftp.gnu.org/gnu/gnucobol/gnucobol-${OC_VERSION}.tar.gz

RUN yum update \
    & yum -y install make automake gcc gcc-c++ kernel-devel gmp-devel libdb-devel git libicu glibc-devel

ADD ${BASE_URL} oc.tar.gz

RUN tar -xzvf oc.tar.gz &&\
    cd gnucobol-$OC_VERSION &&\
    ./configure --prefix=/usr/ &&\
    make install &&\
    ldconfig &&\
    cd .. && rm oc.tar.gz && rm -rf gnucobol-$OC_VERSION

