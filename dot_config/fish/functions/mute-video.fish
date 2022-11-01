function mute-video
    ffmpeg -i $argv[1] -c copy -an $argv[2]
end
