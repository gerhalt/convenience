#!/bin/bash

# Ensure the basic folder infrastructure exists
# (necessary for my config file to function properly)

directories=(~/torrents \
             ~/torrents/current \
             ~/torrents/finished \
             ~/torrents/snatch \
             ~/torrents/seed \
             ~/torrents/session)

for directory_name in ${directories[*]}
do
    if [ ! -d $directory_name ]; then
        printf "%s doesn\'t exist, creating the directory...\n" $directory_name
        mkdir -p $directory_name
    fi
done

# Start a tmux server and a session named rtorrent, then
# create a window within that session and launch rtorrent

# Start tmux server and rtorrent session
tmux start-server
tmux new-session -d -s rtorrent

# Attach a window to that, run rtorrent in it
tmux new-window -t rtorrent:2 -n rtorrent
tmux send-keys -t rtorrent:2 'rtorrent' C-m

tmux list-sessions
