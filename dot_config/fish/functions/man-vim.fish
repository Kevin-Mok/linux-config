function man-vim
    if count $argv > /dev/null
        set prog $argv[1]
    else
        set prog (apropos . | gawk '{ print $1 }' | fzf -e)
    end

    nvim -c ":Man $prog" -c "only"
end
