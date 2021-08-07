function fzf-cd
    set dir (fd -td | fzf)
    cd $dir
end