function git-push-new-gitea
    git remote add $argv[1] ssh://git@kevin-mok.com:399/Kevin-Mok/$argv[2].git
    and git push --set-upstream $argv[1] master
end
