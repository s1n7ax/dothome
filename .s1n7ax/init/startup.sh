cd
wal -R
st || alacritty &
chromium &
transmission-qt || transmission-gtk &
dolphin || thunar || nautilus &
pavucontrol &
/usr/lib/kdeconnectd &

flatpak run com.spotify.Client &
flatpak run com.valvesoftware.Steam &

xsetroot -name "  $(whoami)  "

# prevent screen from turning off
xset s off -dpms
