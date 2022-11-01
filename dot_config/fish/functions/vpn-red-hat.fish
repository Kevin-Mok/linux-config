function vpn-red-hat
    if test $argv[1] = 'up'
        sudo systemctl start NetworkManager.service
        and sleep 3
        and nmcli con up id "1 - Red Hat Global VPN" --ask
    else if test $argv[1] = 'down'
        nmcli con down id "1 - Red Hat Global VPN"
        and sudo systemctl stop NetworkManager.service
    end
end
