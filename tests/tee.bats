@test "should run tee" {
    output="Hello World!"
    tmp="/tmp/$(base64 /dev/urandom | head -c5)"
    result="$(echo $output | ./bin/tee $tmp)"
    [ "$result" = "$output" ]
    [ "$(cat $tmp)" = "$output" ]
}