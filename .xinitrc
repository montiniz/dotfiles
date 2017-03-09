#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#load screen icc profile
dispwin -d1 /usr/share/color/icc/colord/Final.icc

#startx login (default: qtile)
session=${1:-qtile}

case $session in
	qtile		) exec qtile;;
	awesome		) exec awesome;;
	gnome		) exec gnome-session;;
	gnome-classic	) exec gnome-session --session+gnome-classic;;
	#No known session, try to run it as command
	*) exec $1;;
esac

exec xtrace qtile >> ~/qtile.log
