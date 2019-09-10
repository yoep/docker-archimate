FROM debian:buster-slim

# Install dependencies and download/extract Archi
RUN apt-get update && apt-get install -y wget unzip gtk2.0 libgtk2.0-dev xvfb && apt-get clean && \
 wget "https://www.archimatetool.com/downloads/4.5.1/Archi-Linux64-4.5.1.tgz" && tar xvzf "Archi-Linux64-4.5.1.tgz" -C /opt/ && rm "Archi-Linux64-4.5.1.tgz" && \
 chmod +x /opt/Archi/Archi

# Install Collaboration plugin
RUN wget "https://www.archimatetool.com/downloads/plugins/org.archicontribs.modelrepository_0.5.2.201907081356.zip" && \
 mkdir -p ~/.archi4/dropins && unzip "org.archicontribs.modelrepository_0.5.2.201907081356.zip" -d ~/.archi4/dropins && \
 rm "org.archicontribs.modelrepository_0.5.2.201907081356.zip"

# Start virtual display screen
ENV DISPLAY :1
COPY startup.sh /usr/local/bin/startup.sh
CMD ["/bin/bash", "/usr/local/bin/startup.sh"]
