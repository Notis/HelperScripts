#!/bin/bash

function read_mac
{
    ip link | grep $IFACE -A 1 | tail -1 | grep -o -E '[0-9a-f:]{17}' | head -1
}

function my_run
{
    echo "Run: $@"
    "$@" || (echo "Failed" && exit 0)
}

IFACE=$(ip link | grep "state UP" | sed -e 's/^[0-9]*: \([^:]*\):.*/\1/' | head -1)
echo "Iface found $IFACE"
if [ ! "$IFACE" ]; then
    echo "No interface up found."
    exit 1
fi

MAC=$(read_mac)
PYTHON_NMAC="mac='$MAC'.split(':'); ne=(int(mac[-1],16)+1)&0xff; mac[-1]='%x' % ne; print(':'.join(mac))"
NMAC=$(python -c "$PYTHON_NMAC")

echo "Disabling $IFACE"
my_run ip link set $IFACE down
echo "Old mac is $MAC, setting mac to $NMAC"
my_run ip link set addr $NMAC dev $IFACE
NNMAC=$(read_mac)
if [[ "$NMAC" = "$NNMAC" ]]; then
    echo "Successfuly changed mac address."
    echo "Bringing up interface $IFACE."
    my_run ip link set $IFACE up
else
    echo "An error has occured. Mac now is $NNMAC."
fi
