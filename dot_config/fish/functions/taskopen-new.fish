function taskopen-new
    echo "md" | taskopen -A $argv[1] && taskopen -A $argv[1]
end