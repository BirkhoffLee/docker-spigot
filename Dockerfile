FROM openjdk:8-jre

ARG SPIGOT_BUILDTOOLS_URL=https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
ARG SPIGOT_VERSION={1.11}

WORKDIR /data
WORKDIR /tmp/spigot

ADD "${SPIGOT_BUILDTOOLS_URL}" /tmp/spigot/BuildTools.jar

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    cd /tmp/spigot && \
    java -jar BuildTools.jar --rev ${SPIGOT_VERSION} && \
    cp spigot-*.jar /srv/spigot.jar && \
    rm -rf /tmp/spigot

WORKDIR /data

RUN cd /srv && \
    chmod 0444 /srv/spigot.jar && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

ADD runSpigot.sh /usr/local/bin/spigot
RUN chmod +x /usr/local/bin/spigot

ENV JAVA_ARGS ""
ENV SPIGOT_ARGS ""

VOLUME "/data"

CMD ["spigot"]
