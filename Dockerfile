FROM python:2.7-alpine
MAINTAINER tosbaha


RUN cp /etc/apk/repositories /tmp/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --no-cache -U --virtual build_dependencies \
        build-base \
        gfortran \
        libffi-dev \
        zlib-dev \
    && apk add --no-cache -U lapack-dev libstdc++ jpeg-dev \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip install --upgrade numpy==1.14.0 \
    && pip install --upgrade scipy==1.0.0 \
    && pip install --upgrade gunicorn==19.4.5 \
    && pip install --upgrade Pillow==4.3.0 \
    && pip install --upgrade PyBrain==0.3 \
    && apk del build_dependencies \
    && mv /tmp/repositories /etc/apk/repositories