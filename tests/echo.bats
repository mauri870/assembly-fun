@test "should run echo with args" {
    run ./bin/echo 'Test Test Test'
    echo "$output"
    [ "$status" -eq 0 ]
    [ "$output" = "Test Test Test" ]
}

@test "should run echo without args" {
    run ./bin/echo
    echo "$output"
    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}