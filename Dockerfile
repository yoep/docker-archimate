FROM debian:buster-slim

ENV ARCHI_VERSION=4.5.1
ENV COARCHI_VERSION=0.7.1.202102021056

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget unzip gtk2.0 libgtk2.0-dev xvfb && \
    apt-get clean

# Download & extract Archimate tool
RUN wget -nv "https://www.archimatetool.com/downloads/archives/${ARCHI_VERSION}/Archi-Linux64-${ARCHI_VERSION}.tgz" && \
    tar zxvf "Archi-Linux64-${ARCHI_VERSION}.tgz" -C /opt/ && \
    rm "Archi-Linux64-${ARCHI_VERSION}.tgz" && \
    chmod +x /opt/Archi/Archi

# Install Collaboration plugin
RUN wget -nv "https://www.archimatetool.com/downloads/coarchi/org.archicontribs.modelrepository_${COARCHI_VERSION}.archiplugin" && \
    mkdir -p ~/.archi4/dropins && \
    unzip "org.archicontribs.modelrepository_${COARCHI_VERSION}.archiplugin" -d ~/.archi4/dropins && \
    rm "org.archicontribs.modelrepository_${COARCHI_VERSION}.archiplugin"

# Start virtual display screen
ENV DISPLAY :1
COPY startup.sh /usr/local/bin/startup.sh
CMD ["/bin/bash", "/usr/local/bin/startup.sh"]
