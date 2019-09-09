FROM debian:buster-slim

RUN apt-get update && apt-get install -y wget && apt-get clean && \
 wget "https://www.archimatetool.com/downloads/4.5.1/Archi-Linux64-4.5.1.tgz" && tar xvzf "Archi-Linux64-4.5.1.tgz" -C /opt/ && rm "Archi-Linux64-4.5.1.tgz" && \
 chmod +x /opt/Archi/Archi && \
 ln /opt/Archi/Archi Archi
