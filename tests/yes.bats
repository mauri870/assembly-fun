@test "should run yes" {
    result="$(./bin/yes | head -n1)"
    [ "$result" = "y" ]
}