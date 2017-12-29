@test "should run command line args" {
    run ./bin/cmd-args a b
    [ "$status" -eq 0 ]
    [ "$output" = "$(printf './bin/cmd-args\na\nb')" ]
}