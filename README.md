## Minecraft Java Edition in Docker

1. Downloads newest server jar file automatically.
2. Sets EULA based on provided environmental variable.
3. Bind mounts local directory for easy access to your Minecraft worlds. Can be replaced with a named volume if no easy access is required.
4. Starts server with `-Xmx4G -Xms4G -jar server.jar nogui` parameters. Those can be adjusted inside of start.sh file.

### Building

##### Adjust server parameters in start.sh if needed, then run:
``` bash
docker build -f Dockerfile -t image:tag .
```

### Starting

#### Option 1: Docker run

##### Example docker run command
``` bash
docker run \
-it \
--rm \
-v /home/user/Minecraft/data:/data \
-e EULA=TRUE \
-p 25565:25565 \
image:tag
```

#### Option 2: Docker compose

Docker Compose depends on a local .env file to:
 - Accept EULA
 - Select an image
 - Set bind mount directory for server data

##### .env file template:
```
MINECRAFT_DATA=/home/user/Minecraft/data
MINECRAFT_IMAGE=image:tag
```

##### Start your server with a standard
``` bash
docker compose up
```
