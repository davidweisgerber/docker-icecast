FROM ubuntu:16.10

EXPOSE 8000
EXPOSE 8001

VOLUME /data

# update and upgrade packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install icecast2 ezstream psmisc -y
RUN apt-get clean
RUN rm -rf /usr/share/icecast2/*

COPY  startup.sh       /startup.sh

RUN chmod 700 /startup.sh

CMD ["/startup.sh"]
