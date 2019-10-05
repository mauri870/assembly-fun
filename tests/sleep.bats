@test "should run sleep" {
    output="Wake up and die"
    
    timeToSleep=1
    start=$(date +%s)
    $(./bin/sleep $timeToSleep)
    execTime=$(($(date +%s) - start))

    [ "$execTime" = "$timeToSleep" ]
}
