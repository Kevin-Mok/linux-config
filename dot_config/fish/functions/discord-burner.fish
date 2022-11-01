function discord-burner
    # echo nordvpn connect ca1$argv[1] && curl ifconfig.me
    # nordvpn connect ca1$argv[1] && \
    # nordvpn connect ca10$argv[1]
    nordvpn connect
    curl ifconfig.me
    if test (count $argv) -gt 1
        firefox -P discord-$argv[2] $argv[1] &
    else
        firefox -P discord-$argv[1] &
    end
    # for i in (seq $argv[1] $argv[2])
        # firefox -P discord-$i $argv[3] &
    # end
end