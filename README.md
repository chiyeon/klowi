# KLOWI

AUTOMATICALLY CREATES A "slowed to perfection" VIDEO !

## Instructions:
1. Ensure all three Inputs are in the root directory, next to convert.sh (see below)
2. Run convert.sh in the Terminal
3. Enter prompted information
4. Wait until complete!

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
