@test "should run Atoi and Itoa" {
    run atoi-itoa
    [ "$status" -eq 100 ]
    [ "$output" = "100" ]
}