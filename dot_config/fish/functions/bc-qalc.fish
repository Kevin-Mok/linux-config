#function bc-qalc
    #echo "scale=4; $argv[1]" | bc
#end
function bc-qalc
    set -l expression "scale=4; $argv[1]"
    set -l result (echo "$expression" | bc -l)
    python3 -c "print(f'{float($result):,}')"
end