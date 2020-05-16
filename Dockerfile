FROM mono

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vim zip && \
    apt-get clean

ENV VANILLA_VERSION=1401

RUN mkdir /tmp/terraria && \
    cd /tmp/terraria

RUN curl -sL https://terraria.org/server/terraria-server-${VANILLA_VERSION}.zip --output terraria-server.zip

RUN unzip -q terraria-server.zip && \
    mv */Linux /vanilla && \
    mv */Windows/serverconfig.txt /vanilla/serverconfig-default.txt && \
    rm -R /tmp/* && \
    chmod +x /vanilla/TerrariaServer*
    
RUN if [ ! -f /vanilla/TerrariaServer ]; then echo "Missing /vanilla/TerrariaServer"; exit 1; fi

COPY run.sh /vanilla/run.sh

# Allows for external config data for server
VOLUME [ "/config" ]

WORKDIR /vanilla
CMD [ "./run.sh" ]
