# Set cursor
xsetroot -cursor_name left_ptr

# Set background image
#feh --randomize --bg-fill ~/media/wallpaper/* &
feh --bg-fill ~/media/wallpaper/majoras-mask.jpg &

# Start pulseaudio?
start-pulseaudio-x11 &

# Add pulseaudio systray
pasystray &

#xrdb -merge ~/.Xresources
#xrdb -merge ~/.Xdefaults
#xrdb -query |egrep '(fore|back)ground'
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
--expand true --width 10 --transparent true --alpha 0 --tint 0x000000 --height 12 &

# Configure keyboard settings
setxkbmap -layout us -option terminate:ctrl_alt_bksp # Enable Ctrl+Alt+Backspace for killing X
xmodmap -e "keycode 21 = dead_acute dead_grave dead_acute dead_grave U007C notsign"

# Japanese input with uim
#export GTK_IM_MODULE='uim'
#export QT_IM_MODULE='uim'
#uim-xim &
#export XMODIFIERS='@im=uim'

# Start xmonad
exec xmonad
