function rsync-ipad-vid-mov
    rsync --ignore-existing -Ptr IMG_$IPAD_IMG$argv[1].MOV ~/Videos/fortnite/
end