#!/bin/dash

# COMP2041/9044 Assignment1
# test2.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 7, 2024
#
# A test Script containing 3 test for give-summary


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"

# adding the assignment1 
./give-add assignment1 multiply.sh multiply.autotests multiply.automarking > /dev/null


# test 01: no submissions
expected_output="assignment assignment1: submissions from 0 students"
output="$(./give-summary)"
if [ "$output" = "$expected_output" ]; then
    echo "Test 01: ./give-summary (no submissions) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: ./give-summary (no submissions) - ${RED}failed${NOCOL}"
fi


# adding one submissions for one student
./give-submit assignment1 z5393518 multiply_wrong.sh > /dev/null

# test 02: 1 student submission
expected_output="assignment assignment1: submissions from 1 students"
output="$(./give-summary)"
if [ "$output" = "$expected_output" ]; then
    echo "Test 02: ./give-summary (1 student submission) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: ./give-summary (1 student submission) - ${RED}failed${NOCOL}"
fi

# adding one more submission for the prev student
./give-submit assignment1 z5393518 multiply_wrong.sh > /dev/null


# test 03: 1 student submitted 2 submissions should print 1 student
expected_output="assignment assignment1: submissions from 1 students"
output="$(./give-summary)"
if [ "$output" = "$expected_output" ]; then
    echo "Test 03: ./give-summary (1 student submitted 2 submissions) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: ./give-summary (1 student submitted 2 submissions) - ${RED}failed${NOCOL}"
fi


# Clean up: remove .give directory created during tests
rm -rf .give