FROM openjdk:11

EXPOSE 25565

# Create the server directory
RUN mkdir /server
RUN mkdir /server/mods

# Create the eula.txt in the root directory
RUN echo "eula=true" > /server/eula.txt

# Copy files to the /server directory
COPY server.properties /server/
COPY forge.jar /server/
COPY /mods /server/mods

# Set the working directory
WORKDIR /server

# Run the forge installer
RUN java -jar forge.jar --installServer

# Start the server
CMD java -Xmx5120M -Xms5120M -jar ${FILE_NAME_SERVER}.jar --nogui
