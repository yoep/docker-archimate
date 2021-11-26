FROM debian:bookworm-slim

ENV ARCHI_VERSION=4.9.1
ENV COARCHI_VERSION=0.8.0.202110121448

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget unzip gtk2.0 libgtk2.0-dev xvfb && \
    apt-get clean

# Download & extract Archimate tool
RUN wget --post-data="do=${ARCHI_VERSION}%2FArchi-Linux64-${ARCHI_VERSION}.tgz" -o "Archi-Linux64-${ARCHI_VERSION}.tgz" "https://www.archimatetool.com/downloads/archi/" && \
    tar zxvf "index.html" -C /opt/ && \
    rm "Archi-Linux64-${ARCHI_VERSION}.tgz" && rm "index.html" && \
    chmod +x /opt/Archi/Archi

# Install Collaboration plugin
RUN wget "https://www.archimatetool.com/downloads/coarchi1/coArchi_${COARCHI_VERSION}.archiplugin" && \
    mkdir -p ~/.archi4/dropins && \
    unzip "coArchi_${COARCHI_VERSION}.archiplugin" -d ~/.archi4/dropins && \
    rm "coArchi_${COARCHI_VERSION}.archiplugin"

# Start virtual display screen
ENV DISPLAY :1
COPY startup.sh /usr/local/bin/startup.sh
CMD ["/bin/bash", "/usr/local/bin/startup.sh"]
