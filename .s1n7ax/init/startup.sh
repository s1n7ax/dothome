cd
wal -R
st &
chromium &
transmission-qt &
dolphin &
pavucontrol &
/usr/lib/kdeconnectd &

flatpak run com.spotify.Client &
flatpak run com.valvesoftware.Steam &

# prevent screen from turning off
picom &
xsetroot -name "  $(whoami)  "
xset s off -dpms
