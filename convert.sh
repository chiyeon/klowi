#!/bin/bash
echo Starting converter...

# get metadata
read -p "Song Title: " song_title
read -p "Author: " song_author
read -p "Description: " description
read -p "Soundcloud Link: " soundcloud_link

# make output dir
mkdir output

# convert audio to .wav format
ffmpeg -i input.mp3 input.wav

# slow & pitch down input audio
soundstretch input.wav slowed_output.wav -tempo=-12 -pitch=-3

# add reverb
sox slowed_output.wav output/output.wav reverb 70 50 100

# remove temp file
rm slowed_output.wav
rm input.wav

# convert gif to .mp4 video
ffmpeg -i input.gif -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" input.mp4

# get duration of looping video
video_duration=$(ffprobe -i input.mp4 -show_entries format=duration -v quiet -of csv="p=0")
# get duration of song
song_duration=$(ffprobe -i output/output.wav -show_entries format=duration -v quiet -of csv="p=0")
# calculate (rounded) number of times to loop video
num_loops=$(bc -l <<< $song_duration/$video_duration | awk '{print int($1)}')

echo Video duration: $video_duration seconds
echo Song duration: $song_duration seconds
echo Number of Loops: $num_loops

# create file and populate number of times to loop
touch list.txt
for i in $(eval echo {0..$num_loops}); do printf "file '%s'\n" input.mp4 >> list.txt; done
# loop video
ffmpeg -f concat -i list.txt -c copy looped.mp4
# remove temp files
rm list.txt
rm input.mp4

# mix together looped video and audio output
ffmpeg -i looped.mp4 -i output/output.wav -c:v copy -c:a aac output/output.mp4

# remove temp files
rm looped.mp4

# create metadata file
touch output/metadata.txt

# add song title
echo "VIDEO TITLE: $song_author - $song_title (slowed to perfection)" > output/metadata.txt

# add description
echo -e "VIDEO DESCRIPTION: \n\n$description\n\n▶Don't forget to hit like and subscribe for more remixes

▶Comment down below any suggestions, or just how you're feeling

▶Soundcloud Link: $soundcloud_link

▶Visual: I do not mean to steal the gif/picture/video from the original author. This video (music + visual) is for entertainment purposes only, and all credit goes to the original author of the visuals.

▶Copyright Notice: I do not in any way intend to steal the music/visuals. All credit goes to the original artist of the music in the video. I have only transformed it by adding reverb, and slowing it down, for entertainment purposes only.

▶Lyrics" >> output/metadata.txt

cat lyrics.txt >> output/metadata.txt

echo Conversion complete !
echo You may now close this window.
