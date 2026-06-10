#!/bin/sh

if [ "$EULA" = "TRUE" ]; then
  echo "eula=true" > /data/eula.txt
else
  echo "You must accept the EULA"
  exit 1
fi

exec java -Xmx4G -Xms4G -jar /opt/minecraft/server.jar nogui
