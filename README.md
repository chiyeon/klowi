# KLOWI

Automatically creates a "slowed to perfection" video, with a custom description included !

## Instructions:
1. Ensure all three Inputs are in the root directory, next to convert.sh (see below)
2. Paste the song's lyrics into lyrics.txt (if possible)
3. Run convert.sh in the Terminal
4. Enter prompted information
5. Wait until complete!

## The Prompted Information
The script uses a [SONG TITLE], [AUTHOR], [DESCRIPTION], and [SOUNDLCOUD LINK] to generate the video metadata. It will also use the lyrics.txt file. 

The generated metadata will be as follows:
VIDEO TITLE: [AUTHOR] - [SONG TITLE] (slowed to perfection)
VIDEO DESCRIPTION: 

[DESCRIPTION]

▶Don't forget to hit like and subscribe for more remixes

▶Comment down below any suggestions, or just how you're feeling

▶Soundcloud Link: [SOUNDCLOUD LINK]

▶Visual: I do not mean to steal the gif/picture/video from the original author. This video (music + visual) is for entertainment purposes only, and all credit goes to the original author of the visuals.

▶Copyright Notice: I do not in any way intend to steal the music/visuals. All credit goes to the original artist of the music in the video. I have only transformed it by adding reverb, and slowing it down, for entertainment purposes only.

▶Lyrics
[lyrics.txt]

## Files In and Files Out
### Inputs
Place in the root directory, next to convert.sh
 - input.gif (a gif that will be looped throughout the video)
 - input.mp3 (a "dry", normal rendition of the song)
 - lyrics.txt (all the lyrics in the song)
 
### Outputs:
Will be put into a new directory /output/
 - output.mp4 (a video containing the slowed/reverbed audio and a looping gif)
 - output.wav (the actual slowed/reverbed audio)
 - metadata.txt (the generated video title and description)

## Dependencies
 - soundtouch
 - sox
 - ffmpeg
 - awk
 - bc
