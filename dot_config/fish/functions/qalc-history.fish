function qalc-history
    qalc $argv[1] | tee -a /home/kevin/Documents/journal/personal/calc-history.md
end
