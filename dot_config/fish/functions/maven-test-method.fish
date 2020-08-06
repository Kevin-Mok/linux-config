function maven-test-method
    # mvn "-Dtest=$argv[1]#*$argv[2]*" clean test
    mvn "-Dtest=$argv[1]#*$argv[2]*" test
end
