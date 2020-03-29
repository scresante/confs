#!/bin/bash

if (( $# < 1 )); then
    echo 'this is a destructive and uncaring script. run?'
    read x
    [[ $x != 'y' ]] && exit
fi


