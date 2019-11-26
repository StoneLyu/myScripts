#!/bin/bash

FILENAME="$(youtube-dl --proxy socks5://127.0.0.1:18823 --no-check-certificate --get-filename $1)"
VIDEONAME="VIDEO_$(youtube-dl -f dash-VIDEO-1 --proxy socks5://127.0.0.1:18823 --no-check-certificate --get-filename $1)"
AUDIONAME="AUDIO_$(youtube-dl -f dash-AUDIO-1 --proxy socks5://127.0.0.1:18823 --no-check-certificate --get-filename $1)"

# echo $VIDEONAME
# echo $AUDIONAME

youtube-dl -f dash-VIDEO-1 --proxy socks5://127.0.0.1:18823 --no-check-certificate  "$1" -o "$VIDEONAME"

youtube-dl -f dash-AUDIO-1 --proxy socks5://127.0.0.1:18823 --no-check-certificate  "$1" -o "$AUDIONAME"

ffmpeg -i "$VIDEONAME" -i "$AUDIONAME" "$FILENAME"

rm "$VIDEONAME"
rm "$AUDIONAME"