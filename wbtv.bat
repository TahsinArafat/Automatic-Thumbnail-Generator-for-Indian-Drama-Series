for %%t in ("input\*.*") DO ffmpeg -y -i "%%t" -f image2 -vf "fps=1/10" -preset ultrafast "temp1/%%~nt_%%3d.png"
for %%t in ("input\*.*") DO ffmpeg -r 1 -f image2 -s 1280x720 -y -i "temp1\%%~nt_%%3d.png" -i "overlays/wbtv.png" -filter_complex "[0:v]scale=1280:720[vvid];[vvid][1:v]overlay=0:0" -preset ultrafast "temp2\%%~nt.mp4"

for %%t in ("temp2\*.*") DO ffmpeg -y -i "%%t" -f image2 -vf "fps=1/1" -preset ultrafast "output/%%~nt_THUMBNAIL_%%3d.png"

del temp1\*png
del temp2\*mp4