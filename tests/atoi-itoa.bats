@test "should run Atoi and Itoa" {
    run ./bin/atoi-itoa
    [ "$status" -eq 0 ]
    [ "$output" = "100100" ]
}