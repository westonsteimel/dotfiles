#!/bin/sh
#exec setxkbmap -layout gb
[[ -f ~/.Xresources ]]  && xrdb -merge ~/.Xresources

exec i3
#exec setxkbmap -layout gb
