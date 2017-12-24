@test "should run Hello World" {
    run hello-world
    [ "$status" -eq 0 ]
    [ "$output" = "Hello World!" ]
}