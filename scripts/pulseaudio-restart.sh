pulseaudio --kill
killall pulseaudio
killall -9 pulseaudio
rm -rf ~/.pulse*
rm -rf /tmp/pulse*
pulseaudio --start -D
start-pulseaudio-x11
