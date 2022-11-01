function scp-vid
    set dest_dir "/mnt/linux-files/Videos/personal-fortnite-games/review"
	if test $argv[1] = 'pogo'
        set dest_dir "/mnt/linux-files/Videos/pokemon-go"
    end
    scp -P 8022 192.168.0.18:/data/data/com.termux/files/home/storage/dcim/\'Screen\ recordings\'/$argv[2] $dest_dir
end