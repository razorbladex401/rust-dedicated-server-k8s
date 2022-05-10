FROM steamcmd/steamcmd:latest

# install deps
RUN useradd -m steam \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y net-tools \
    && apt-get install -y nano \
    && apt-get install -y vim \
    && apt-get install -y \
        lib32gcc1 \
        libcap-dev \
        libcurl4 \
        libcurl4-openssl-dev \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

USER steam

ENV USER steam
ENV HOME /home/steam
ENV GAME rust
ENV APPID 2585500
ENV STEAMACCOUNT anonymous
ENV STEAMPASSWORD ${1:+1}
ENV CPUCOUNT 2
ENV PORT 28015
ENV RCON 28016
ENV HOSTNAME "My Rust Server"
ENV IDENTITY "my_rust_server"
ENV MAXPLAYERS 30
ENV WORLDSIZE 3000
ENV SEED 50000
ENV SAVEINTERVAL 600
ENV RCONPASSWORD ${1:+1}

WORKDIR /home/steam

# permissions
RUN mkdir ${HOME}/${GAME} && \
    chown -R steam:steam ${HOME}

# Exposed Ports
# game
EXPOSE ${PORT}/udp
# rcon
EXPOSE ${RCON}/udp

# update steamcmd
RUN steamcmd +quit

# define entrypoint
COPY entry.sh ${HOME}/entry.sh
ENTRYPOINT "${HOME}/entry.sh"
