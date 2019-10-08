function server-pages
    set sites kevin-mok.com git.kevin-mok.com cal.khkm.tk mnpd.gq/kbg pste.gq smol.gq twem.tk
    set titles "Kevin Mok" "Kevin Mok's Gitea" "BaÃ¯kal server" "kbg" "hastebin" "Kevin's URL Shortener" "Twitch Emote Links"
    # set sites twem.tk
    # set titles "Twitch Emote Links"

    for i in (seq (count $sites))
        set title (wget -qO- "$sites[$i]" | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si' | recode html)
        if test $title = $titles[$i]
            set symbol "✓"
        else
            set symbol "✗"
        end
        printf "[$symbol] $sites[$i]\n"
    end
end

