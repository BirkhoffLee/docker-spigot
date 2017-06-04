# docker_spigot
Our Docker image for running a Spigot instance.

# Usage
```bash
$ docker build -t spigot .
$ docker run -P -e "JAVA_ARGS=-Xmx1G -Xms512M" -v $(pwd)/spigotdata:/data -itd --name my-spigot spigot
$ docker attach spigot
```
