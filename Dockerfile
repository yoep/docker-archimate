FROM debian:buster-slim

RUN apt-get update && apt-get install -y wget && apt-get clean && \
 wget "https://www.archimatetool.com/downloads/4.5.1/Archi-Linux64-4.5.1.tgz" && tar xvzf "Archi-Linux64-4.5.1.tgz" && rm "Archi-Linux64-4.5.1.tgz" && \
 mv Archi/ Archi-tmp/ && mv Archi-tmp/* . && \
 chmod +x Archi
