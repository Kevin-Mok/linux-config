function readlink-cp
    readlink -f $argv[1] | xclip -selection clipboard
end
