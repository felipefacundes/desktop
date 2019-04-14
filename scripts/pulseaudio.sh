#/bin/bash
pkill pulseaudio;
pactl load-module module-equalizer-sink;
pactl load-module module-dbus-protocol;
exit;
pkill pulseaudio;
pactl load-module module-equalizer-sink;
pactl load-module module-dbus-protocol;
exit
