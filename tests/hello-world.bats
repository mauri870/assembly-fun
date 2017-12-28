@test "should run Hello World" {
    run ./bin/hello-world
    [ "$status" -eq 0 ]
    [ "$output" = "Hello World!" ]
}