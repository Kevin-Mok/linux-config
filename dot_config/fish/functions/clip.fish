function clip
    if test (count $argv) -eq 3
        ffmpeg -ss $argv[1] -i $argv[2] -codec copy $argv[3]
    else
        ffmpeg -ss $argv[1] -to $argv[2] -i $argv[3] -codec copy $argv[4]
    end
end
