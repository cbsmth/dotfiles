# Set cursor
xsetroot -cursor_name left_ptr

# Set background image
feh --bg-fill /home/fredrik/media/pictures/wallpaper/IDL_1080p_wallpaper.png &

# Configure keyboard settings
setxkbmap -layout se
xmodmap -e "keycode 21 = dead_acute dead_grave dead_acute dead_grave U007C notsign"

# Japanese input with uim
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# Start xmonad
exec xmonad
