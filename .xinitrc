#!/bin/sh
#exec setxkbmap -layout gb
[[ -f ~/.Xresources ]]  && xrdb -merge ~/.Xresources

xhost local:root

exec i3 -V >> ~/.i3/logfile 2>&1
#exec setxkbmap -layout gb
