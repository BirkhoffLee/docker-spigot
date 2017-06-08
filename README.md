# docker-spigot
My Docker image for running a Spigot instance.

**This repository is no longer being updated; I'm moving this to a private repository. I didn't delete this repository because I hope it can help someone else.**

# Usage
```bash
$ docker build -t spigot .
$ docker run -P -e "JAVA_ARGS=-Xmx1G -Xms512M" -v $(pwd)/spigotdata:/data -itd --name my-spigot spigot
$ docker attach spigot
```
