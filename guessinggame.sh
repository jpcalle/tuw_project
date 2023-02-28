#!/usr/bin/env bash

function check_guess {
    if [[ $1 -eq $2 ]]
    then
        echo "Congrats, your guess is correct. There are $num_files files."
        return 0
    elif [[ $1 -lt $2 ]]
    then
        echo "Sorry, wrong guess. Too low. Try again."
        return -1
    elif [[ $1 -gt $2 ]]
    then
        echo "Sorry, wrong guess. Too high. Try again."
        return 1
    else
        echo "Wrong entry, must be a number between 0 and Inf."
        return -99
    fi
}

num_files=0
for file in $(ls)
do
    let num_files=$num_files+1
done

function ask {
    echo "Guess how many files are in the current directory?"
    read guess
}

ask
check_guess $guess $num_files
while [[ $? -ne 0 ]]
do
    ask
    check_guess $guess $num_files
done

