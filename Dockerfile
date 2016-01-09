FROM ubuntu:latest

EXPOSE 8000

VOLUME /data

# update and upgrade packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install icecast2 ezstream psmisc -y
RUN apt-get clean

COPY  startup.sh       /startup.sh

RUN chmod 700 /startup.sh

CMD ["/startup.sh"]
