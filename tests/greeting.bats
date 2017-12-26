@test "should run Greeting" {
    result="$(echo 'Assembly' | greeting)"
    [ "$result" = "Hello Assembly" ]
}