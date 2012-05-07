#xrdb -merge .Xresources
#xpmroot ~/Documents/simple_wallpaper.xpm
#xpmroot ~/Pictures/Xmbindings.png
#trayer --edge top --align right --SetDockType true --SetPartialStrut true \
# --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
#~/.cabal/bin/xmonad
/usr/bin/xrandr --output VGA1 --mode 1280x1024 --left-of LVDS1 --output LVDS1 --mode 1280x800
xmodmap ~/.xmodmap
awesome -c ~/.config/awesome/rc.lua >/tmp/awesome.log 2>&1
