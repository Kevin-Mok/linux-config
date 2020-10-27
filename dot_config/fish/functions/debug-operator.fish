function debug-operator
    if test (count $argv) -gt 0
        git pull --rebase 
    end
    make mod clean 
    and DEBUG=true operator-sdk run --local --watch-namespace=3376 &| tee debug-operator.log
end
