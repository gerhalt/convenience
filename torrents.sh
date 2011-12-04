#!/bin/bash

# Start a tmux server and a session named rtorrent, then
# create a window within that session and launch rtorrent

# Start tmux server and rtorrent session
tmux start-server
tmux new-session -d -s rtorrent

# Attach a window to that, run rtorrent in it
tmux new-window -t rtorrent:2 -n rtorrent
tmux send-keys -t rtorrent:2 'rtorrent' C-m

tmux list-sessions
