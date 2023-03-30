function video-to-gif
    # ffmpeg -i $argv[1] -filter_complex "[0:v]setpts=0.5*PTS,fps=24,split [a][b];[a] palettegen [p];[b][p] paletteuse" $argv[2]
    ffmpeg -i $argv[1] -filter_complex "[0:v]fps=24,split [a][b];[a] palettegen [p];[b][p] paletteuse" $argv[2]
end