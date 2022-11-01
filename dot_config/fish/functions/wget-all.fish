function wget-all
    for url in $argv
        wget $url
    end
end
