#!/bin/bash

function updateGame() {
    steamcmd \
        +login ${STEAMACCOUNT} ${STEAMPASSWORD} \
        +force_install_dir ${HOME}/${GAME} \
        +app_update ${APPID} \
        +quit
}

function startGame() {
	cd ${HOME}/${GAME}
	${HOME}/${GAME}/RustDedicated -batchmode +server.ip 0.0.0.0 +server.port ${PORT} +server.tickrate ${TICKRATE} +server.hostname "${HOSTNAME}" +server.identity "${IDENTITY}" +server.seed ${SEED} +server.maxplayers ${MAXPLAYERS} +server.worldsize ${WORLDSIZE} +server.saveinterval ${SAVEINTERVAL} +rcon.ip 0.0.0.0 +rcon.port ${RCON} +rcon.password "${RCONPASSWORD}" -logfile "rust-${IDENTITY}.log"

}

updateGame
startGame

