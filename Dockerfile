FROM openjdk:8-jre

ARG SPIGOT_URL=https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

WORKDIR /data
ADD "${SPIGOT_URL}" /srv/spigot.jar
RUN cd /srv && \
    java -jar spigot.jar --version && \
    chmod 444 /srv/spigot.jar && \
    echo "eula=true" > /data/eula.txt

ADD runSpigot.sh /usr/local/bin/spigot
RUN chmod +x /usr/local/bin/spigot

ENV JAVA_ARGS ""
ENV SPIGOT_ARGS ""

VOLUME "/data"

CMD ["spigot"]
