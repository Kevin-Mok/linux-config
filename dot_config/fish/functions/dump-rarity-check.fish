function dump-rarity-check
    pg_dump -U rarity_check rarity_check > $argv[1].sql
end