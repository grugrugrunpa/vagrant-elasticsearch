#!/bin/bash

PID=""
while : ; do sleep 30; curl http://localhost; done &
PID="$!"
while : ; do sleep 5; curl http://$(hostname); done &
PID="$PID $!"
while : ; do sleep 10; curl http://$(hostname)/hoge; done &
PID="$PID $!"

trap "kill $PID" 1 9 15

wait $PID
