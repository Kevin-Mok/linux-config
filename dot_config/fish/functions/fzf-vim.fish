function fzf-vim
    set file (fzf)
    if test ! -z "$file"
        $EDITOR $file
    end
end
