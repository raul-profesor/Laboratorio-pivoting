FROM phusion/baseimage:jammy-1.0.1

RUN apt update -y \
    && apt install -y python3-pip 

WORKDIR /opt

RUN apt install wget -y \
    && wget "https://master.dl.sourceforge.net/project/sar2html/sar2html-4.0.0.tar.gz?viasf=1" \
    && tar -xvf *

WORKDIR /opt/sar2html-4.0.0/

RUN echo Werkzeug==2.3.7 >> requirements.txt

RUN echo toolz >> requirements.txt

RUN pip3 install -r requirements.txt

CMD bash -c "./startWeb"

