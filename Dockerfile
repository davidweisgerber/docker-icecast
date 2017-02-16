FROM ubuntu:16.10

EXPOSE 8000
EXPOSE 8001

VOLUME /data

# update and upgrade packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install ezstream psmisc git build-essential autoconf libtool libxslt-dev libogg-dev libvorbis-dev libtheora-dev libspeex-dev libcurl4-openssl-dev pkg-config libssl-dev -y
RUN apt-get clean

RUN git clone --recursive https://git.xiph.org/icecast-server.git && cd icecast-server && ./autogen.sh && ./configure --prefix=/usr --with-openssl && make && make install && cd ..

RUN rm -rf /usr/share/icecast2/* && rm -rf /icecast-server

COPY  startup.sh       /startup.sh

RUN chmod 700 /startup.sh

CMD ["/startup.sh"]
