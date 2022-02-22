#!/bin/bash

input="video.mkv"
output="game.gif"
name="palette.png"

filters="fps=30,scale=600:-1:flags=lanczos"
ffmpeg -v verbose -i $input -vf palettegen $name
ffmpeg -v verbose -i $input -vf "$filters,palettegen" -y $name
ffmpeg -v verbose -i $input -i $name -lavfi "$filters [x]; [x][1:v] paletteuse" -y $output

rm $name
