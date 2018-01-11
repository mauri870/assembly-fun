@test "should run seq" {
    output="$(seq 100)"
    result="$(./bin/seq 100)"
    [ "$result" = "$output" ]
}

@test "should run seq with start and end" {
    output="$(seq 1 100)"
    result="$(./bin/seq 1 100)"
    [ "$result" = "$output" ]
}