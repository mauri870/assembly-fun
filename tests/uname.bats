@test "should run uname" {
    run ./bin/uname
    KERNEL=$(uname -r)
    [ "$status" -eq 0 ]
    [ "$output" = "Linux Kernel version: $KERNEL" ]
}