function unmount-ipad
    fuser -km /mnt/ipad
    fusermount -u /mnt/ipad
end