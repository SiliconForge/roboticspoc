#!/bin/sh
#ffmpeg -f lavfi -i color=c=black:s=1920x1080 -r 60 -t 2 -vf "drawtext=fontfile=/path/to/font.ttf:fontsize=30:fontcolor=white:x=(w-text_w)/2:y=(h-text_h)/2:text='$(cat textsample.txt)',fade=type=in:duration=0.5, fade=type=out:duration=0.5:start_time=1.5" tmp/text.mp4
ffmpeg -framerate 60 -i tmp/img%03d.png tmp/pre.mp4
ffmpeg -framerate 60 -loop 1 -i tmp/original.png -t 2 -vf "fade=type=in:duration=0.5, fade=type=out:duration=0.5:start_time=1.5" tmp/original.mp4
#ffmpeg -framerate 60 -loop 1 -i tmp/corrmap.png -t 2 -vf "fade=type=in:duration=0.5, fade=type=out:duration=0.5:start_time=1.5" tmp/corrmap.mp4
#ffmpeg -framerate 60 -loop 1 -i tmp/history2.png -t 2 -vf "fade=type=in:duration=0.5, fade=type=out:duration=0.5:start_time=1.5" tmp/history2.mp4
#ffmpeg -framerate 60 -loop 1 -i tmp/r2.png -t 2 -vf "fade=type=in:duration=0.5, fade=type=out:duration=0.5:start_time=1.5" tmp/r2.mp4
ffmpeg -f concat -safe 0 -i lista.txt done/$(date -u +%s).mp4
rm tmp/*.mp4
rm tmp/*.png
exit 0

