FROM fedora:32 

MAINTAINER caozhi1214@gmail.com

RUN dnf install wget gcc python3-devel vim zlib-devel psmisc findutils procps bzip2 sqlite -y
RUN pip3 install flask-script marshmallow wget bs4 

WORKDIR /pkgmanage

COPY openEuler_aarch64.repo ./
COPY conf.yaml ./
COPY pkgship-*.rpm ./
COPY python3-*.rpm ./

RUN dnf install python3-*.rpm -y
RUN dnf install pkgship-*.rpm -y
RUN dnf clean all

#COPY conf.yaml /etc/pkgship

#RUN pkgshipd start
#CMD ["pkgshipd", "start"] 

