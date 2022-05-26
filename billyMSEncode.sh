#!/bin/bash

TARGETFOLDER=$1

for f in $TARGETFOLDER*.mp4;
do
    echo "Processing file $f"

    # get file name up to $TARGETFOLDER for saving locally
    exportFileName="./"$(basename "$f")

    # run the stupid command
    ffmpeg -i $f -c:v libx264 -crf 18 -preset slow -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -c:a copy $exportFileName
done