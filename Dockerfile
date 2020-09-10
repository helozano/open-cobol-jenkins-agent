FROM openshift/jenkins-slave-base-centos7


ARG OC_VERSION=2.2
ARG BASE_URL=http://ftp.gnu.org/gnu/gnucobol/gnucobol-${OC_VERSION}.tar.gz

ADD ${BASE_URL} oc.tar.gz
RUN yum update \
    & yum -y install make automake gcc gcc-c++ kernel-devel gmp-devel libdb-devel git libicu

RUN tar -xvf oc.tar.gz 
#&\ 
#    cd gnucobol-2.2 &\   
#    ./configure --prefix=/usr/ &\
#    make install

