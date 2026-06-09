FROM alpine AS download

WORKDIR /downloads

RUN wget "https://piston-data.mojang.com/v1/objects/97ccd4c0ed3f81bbb7bfacddd1090b0c56f9bc51/server.jar"

FROM eclipse-temurin AS server

WORKDIR /data

RUN mkdir /opt/minecraft

COPY --from=download /downloads /opt/minecraft

RUN echo "eula=true" > eula.txt

EXPOSE 25565

COPY eula.sh /eula.sh

RUN chmod +x /eula.sh

ENTRYPOINT ["/eula.sh"]

# CMD is located in eula.sh that ENTRYPOINT points to.
# Dupa
