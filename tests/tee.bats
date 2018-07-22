@test "should run tee" {
    output="Hello World!"
    tmp="$(mktemp -u)"
    result="$(echo $output | ./bin/tee $tmp)"
    [ "$result" = "$output" ]
    [ "$(cat $tmp)" = "$output" ]
    rm $tmp
}