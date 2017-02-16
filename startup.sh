#!/bin/bash

at_term() { 
  echo "Caught SIGTERM signal!" 
  
  killall -9 icecast
  /sbin/start-stop-daemon -K --pidfile=/var/run/ezstream.mp3.pid
  
  exit 0
}

/usr/bin/icecast -b -c /data/icecast.xml
sleep 1
/sbin/start-stop-daemon -S --quiet --background --make-pidfile --pidfile /var/run/ezstream.mp3.pid --exec /usr/bin/ezstream --chuid icecast2:icecast -- -c /data/ezstream_mp3.xml

tail -f /var/log/icecast/access.log -f /var/log/icecast/error.log  &

while true; do
    sleep 20
done
