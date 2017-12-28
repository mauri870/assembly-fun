@test "should run cat" {
    result="$(./bin/cat /etc/hosts)"
    [ "$result" = "$(cat /etc/hosts)" ]
}