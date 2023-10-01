function clip-ipad
    if test (count $argv) -eq 3
        ffmpeg -ss $argv[1] -i IMG_$IPAD_IMG$argv[2].MP4 -codec copy $argv[3]
    else
        ffmpeg -ss $argv[1] -to $argv[2] -i IMG_$IPAD_IMG$argv[3].MP4 -codec copy $argv[4]
    end
end
