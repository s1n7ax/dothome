cd
wal -R
alacritty || st &
chromium &
transmission-qt || transmission-gtk &
nautilus || dolphin || thunar &
pavucontrol &
/usr/lib/kdeconnectd &

flatpak run com.spotify.Client &
flatpak run com.valvesoftware.Steam &

xsetroot -name "  $(whoami)  "

# prevent screen from turning off
xset s off -dpms
