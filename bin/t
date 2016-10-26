#!/bin/bash
#
# Convenience script for attaching to a default tmux session.
#
# Adapted from http://forums.gentoo.org/viewtopic-t-836006-start-0.html
#
# Motive:
#   I have long-running tmux sessions on servers. With this, you can shell to
#   a host, type 't', and have it make a best effort to come back to a single
#   standard console.
#

# Works because bash automatically trims by assigning to variables and by 
# passing arguments
trim() { echo $1; }

if [[ -z "$1" ]]; then
    ARG="default"
else
    ARG=$1
fi

# Only because I often issue `ls` to this script by accident
if [[ "$ARG" == "ls" ]]; then
    tmux ls
    exit
fi

base_session="$ARG"
# This actually works without the trim() on all systems except OSX
tmux_nb=$(trim `tmux ls | grep "^$base_session" | wc -l`)
if [[ "$tmux_nb" == "0" ]]; then
    echo "Launching tmux base session $base_session ..."
    # dash 2 is to force support for more colours
    #tmux -2 new-session -s $base_session htop
    tmux -2 new-session -s $base_session
else
    # Make sure we are not already in a tmux session
    if [[ -z "$TMUX" ]]; then
        # Kill defunct sessions first
        old_sessions=$(tmux ls 2>/dev/null | egrep "^[0-9]{14}.*[0-9]+\)$" | cut -f 1 -d:)
        for old_session_id in $old_sessions; do
            tmux kill-session -t $old_session_id
        done

        echo "Launching copy of base session $base_session ..."
        # Session is is date and time to prevent conflict
        session_id=`date +%Y%m%d%H%M%S`
        # Create a new session (without attaching it) and link to base session 
        # to share windows
        tmux -2 new-session -d -t $base_session -s $session_id
        # Create a new window in that session
        #tmux new-window
        # Attach to the new session
        tmux -2 attach-session -t $session_id
        # When we detach from it, kill the session
        tmux kill-session -t $session_id
    fi
fi

