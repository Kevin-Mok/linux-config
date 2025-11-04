function rsync-ipad-vid
    #rsync --ignore-existing -Ptr IMG_$IPAD_IMG$argv[1].MP4 /mnt/linux-files-2/Videos/ipad/fortnite/name
    rsync --ignore-existing -Ptr IMG_$IPAD_IMG$argv[1].MP4 /mnt/linux-files-3/fortnite
    #rsync --ignore-existing -Ptr IMG_$IPAD_IMG$argv[1].MP4 ~/Videos/fortnite/
end