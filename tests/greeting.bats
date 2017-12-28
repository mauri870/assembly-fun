@test "should run Greeting" {
    result="$(echo 'Assembly' | ./bin/greeting)"
    [ "$result" = "Hello Assembly" ]
}