#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -n "`/etc/X11/chooser.sh`" ]; then
 command="`/etc/X11/chooser.sh`"
else
 failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# faster keyboard
xset r rate 400 100

# refresh .Xresources and apply pywal
xrdb ~/.cache/wal/st-Xresources && wal -R

# mpd
mpd &

# one instance of mpdscribble
pgrep -x mpdscribble > /dev/null || mpdscribble

# compositor
picom &

# redshift
redshift &

# clipboard manager
clipmenud &

# pywalfox 
pywalfox start &

# start bspwm
exec bspwm
