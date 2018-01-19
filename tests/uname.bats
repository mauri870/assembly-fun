@test "should run uname" {
    expected="$(uname -a)"
    output="$(./bin/uname | tr -d '\0' |  rev | cut -d ' ' -f3- | rev)"
    [ "$?" -eq 0 ]
    [[ "$expected" == "$output"* ]]
}