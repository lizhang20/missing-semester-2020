#!/usr/bin/env bash

file="failure.sh"

# stdout to run.log 
# stderr to error.log
./$file 1>>run.log 2>>error.log

while [[ $? -eq 0 ]]; do
    ./$file 1>>run.log 2>>error.log
done

echo "run $0 finished"