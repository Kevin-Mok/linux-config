function git-push-new-gitea
    git remote add origin ssh://git@kevin-mok.com:399/Kevin-Mok/$argv[1].git
    and git push --set-upstream origin master
end
