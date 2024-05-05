#!/usr/bin/env sh

steamcmd +force_install_dir /server/ +login anonymous +app_update 222860 validate +exit

rm -rf /server/left4dead2/addons/
rm -rf /server/left4dead2/cfg/server.cfg

cp -r /server.skeleton/{addons,cfg} /server/left4dead2/

touch /server/left4dead2/cfg/custom.cfg

exec /server/srcds_run -game left4dead2 -tickrate 100 +ip 0.0.0.0 +map c1m1_hotel +maxplayers 20 +sv_maxplayers 20 "$@"