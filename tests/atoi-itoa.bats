@test "should run Atoi and Itoa" {
    run ./bin/atoi-itoa
    [ "$status" -eq 100 ]
    [ "$output" = "100" ]
}