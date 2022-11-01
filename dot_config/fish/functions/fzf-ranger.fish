function fzf-ranger
    set dir (fd -td | fzf)
    if test ! -z "$dir"
        ranger $dir
    end
end
