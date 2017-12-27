@test "should run uname" {
    run uname
    KERNEL=$(/usr/bin/uname -r)
    [ "$status" -eq 0 ]
    [ "$output" = "Linux Kernel version: $KERNEL" ]
}