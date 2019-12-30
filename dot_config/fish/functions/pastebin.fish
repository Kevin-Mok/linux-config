function pastebin
    # cat $argv[1] | curl -F 'sprunge=<-' http://sprunge.us
    # set -x HASTE_SERVER https://pste.gq
    # cat $argv[1] | haste --raw
    cat $argv[1] | haste
end
