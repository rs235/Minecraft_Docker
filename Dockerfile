FROM alpine AS download # Use Alipne Linux as image base for downloading the server executable.

WORKDIR /downloads # Set working directory for Alpine to "downloads".

RUN wget "https://piston-data.mojang.com/v1/objects/97ccd4c0ed3f81bbb7bfacddd1090b0c56f9bc51/server.jar" # Download server jar file.

FROM eclipse-temurin AS server # Use eclipse-temurin as image base for running the server jar file.

WORKDIR /data # Set working directory to "data".

RUN mkdir /opt/minecraft # Create a directory for server installation.

COPY --from=download /downloads /opt/minecraft # Copy jar file downloaded via Alpine to newly created server directory.

EXPOSE 25565 # Expose port TCP 25565.

COPY eula.sh /eula.sh # Copy eula script to /opt/minecraft.

RUN chmod +x /eula.sh # Make eula.sh script executable.

ENTRYPOINT ["/eula.sh"] # Set entrypoint to eula.sh which sets EULA based on EULA= enironmental variable and starts the server when executed.

# CMD is located in eula.sh that ENTRYPOINT points to.
