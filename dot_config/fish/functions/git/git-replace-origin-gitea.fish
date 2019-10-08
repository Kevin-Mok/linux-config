function git-replace-origin-gitea
    git remote remove origin
    and git remote add origin ssh://git@kevin-mok.com:399/Kevin-Mok/$argv[1].git
    and git branch --set-upstream-to=origin/master master
    and git push
end
