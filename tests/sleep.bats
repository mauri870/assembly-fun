@test "should run sleep" {
    output="Wake up and die"
    
    timeToSleep=1
    start=$(date +%s)
    result="$(./bin/sleep $timeToSleep)"
    execTime=$(($(date +%s) - start))

    [ "$result" = "$output" ]
    [ "$execTime" = "$timeToSleep" ]
}