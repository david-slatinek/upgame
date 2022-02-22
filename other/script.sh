#!/bin/bash

input="video.mkv"
output="game.gif"
name="palette.png"

ffmpeg -v verbose -i $input -vf palettegen $name
ffmpeg -v verbose -i $input -vf "palettegen" -y $name
ffmpeg -v verbose -i $input -i $name -lavfi "paletteuse" -y $output

rm $name
