FROM debian:buster-slim

ENV ARCHI_VERSION=4.8.1
ENV COARCHI_VERSION=0.7.1.202102021056

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget gtk2.0 libgtk2.0-dev xvfb && \
    apt-get clean

# Download & extract Archimate tool
RUN wget --post-data="dl=Archi-Linux64-${ARCHI_VERSION}.tgz" -o "Archi-Linux64-${ARCHI_VERSION}.tgz" "https://www.archimatetool.com/downloads/archi/" && \
    tar zxvf "index.html" -C /opt/ && \
    rm "Archi-Linux64-${ARCHI_VERSION}.tgz" && rm "index.html" && \
    chmod +x /opt/Archi/Archi

# Install Collaboration plugin
RUN wget "https://www.archimatetool.com/downloads/coarchi/org.archicontribs.modelrepository_${COARCHI_VERSION}.archiplugin" && \
    mkdir -p ~/.archi4/dropins && \
    mv -v "org.archicontribs.modelrepository_${COARCHI_VERSION}.archiplugin" ~/.archi4/dropins/

# Start virtual display screen
ENV DISPLAY :1
COPY startup.sh /usr/local/bin/startup.sh
CMD ["/bin/bash", "/usr/local/bin/startup.sh"]
