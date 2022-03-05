cd
wal -R
st &
st &
flatpak run com.github.Eloston.UngoogledChromium &
# flatpak run org.mozilla.firefox &
flatpak run com.transmissionbt.Transmission &
# flatpak run com.spotify.Client &
dolphin &
pavucontrol &
/usr/lib/kdeconnectd &

# prevent screen from turning off
xset s off -dpms
picom &
xsetroot -name "  $(whoami)  "
