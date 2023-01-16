#!/bin/bash

# Takes a number and prints whether it's divisible by 2, 3 or 5

isNumberDivisible() {
    local number=$1 # Get the argument
    local exitCode=1

    for i in {2,3,5}
    do
        if [ $((number % i)) -eq 0 ]; then
            echo "$number is divisible by $i"
            exitCode=0
        fi
    done

    return $exitCode
}

read -p "Input a number: " inputNumber
isNumberDivisible $inputNumber # Use $ to pass the value of inputNumber
exitCode=$? # Get the exit code of the previous command
if [ $exitCode -eq 1 ]; then
    echo "$inputNumber is not divisible by 2, 3 or 5"
fi