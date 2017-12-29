@test "should run true" {
    run ./bin/true
    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}