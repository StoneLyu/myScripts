#!/bin/bash

# downloading reddit videos via youtube-dl gets the videos files without audios.
# so, the audios (if exist) are required to download manually
# and merge the audio and video files into one.

# this is the name of final output
FILENAME="$(youtube-dl --proxy socks5://127.0.0.1:18823 --no-check-certificate --get-filename $1)"
# this is the name of video
VIDEONAME="VIDEO_$(youtube-dl -f dash-VIDEO-1 --proxy socks5://127.0.0.1:18823 --no-check-certificate --get-filename $1)"
# this is the name of audio
AUDIONAME="AUDIO_$(youtube-dl -f dash-AUDIO-1 --proxy socks5://127.0.0.1:18823 --no-check-certificate --get-filename $1)"

# echo $VIDEONAME
# echo $AUDIONAME

# download video and audio 
youtube-dl -f dash-VIDEO-1 --proxy socks5://127.0.0.1:18823 --no-check-certificate  "$1" -o "$VIDEONAME"
youtube-dl -f dash-AUDIO-1 --proxy socks5://127.0.0.1:18823 --no-check-certificate  "$1" -o "$AUDIONAME"

# merge two files
ffmpeg -i "$VIDEONAME" -i "$AUDIONAME" "$FILENAME"

# remove video and audio files
rm "$VIDEONAME"
rm "$AUDIONAME"