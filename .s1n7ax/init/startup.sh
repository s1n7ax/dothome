cd
wal -R
st || alacritty &
chromium &
transmission-qt || transmission-gtk &
dolphin || thunar || nautilus &
pavucontrol &
/usr/lib/kdeconnectd &

flatpak run com.spotify.Client &
steam || flatpak run com.valvesoftware.Steam &

# prevent screen from turning off
picom &
xsetroot -name "  $(whoami)  "
xset s off -dpms
