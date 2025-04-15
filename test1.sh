#!/bin/dash

# COMP2041/9044 Assignment1
# test1.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 7, 2024
#
# A test Script containing 3 test for certain parts of give-submit


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"

# test 01: assignment not found
expected_output="give-submit: assignment assignment1 not found"
output=$(./give-submit assignment1 z5393518 multiply_wrong.sh 2>&1)
if [ "$output" = "$expected_output" ]; then
    echo "Test 01: ./give-submit (assignment not found) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: ./give-submit (assignment not found) - ${RED}failed${NOCOL}"
fi


# adding the assignment1 
./give-add assignment1 multiply.sh multiply.autotests multiply.automarking > /dev/null


# test 02: no such file/dir
expected_output="give-submit: abc.sh: No such file or directory"
output=$(./give-submit assignment1 z5393518 abc.sh 2>&1)
if [ "$output" = "$expected_output" ]; then
    echo "Test 02: ./give-submit (no such file/dir) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: ./give-submit (no such file/dir) - ${RED}failed${NOCOL}"
fi

# test 03: invalid assignment name
expected_output="give-submit: invalid assignment: Assignment1"
output=$(./give-submit Assignment1 z5393518 multiply_wrong.sh 2>&1)
if [ "$output" = "$expected_output" ]; then
    echo "Test 03: ./give-submit (invalid assignment name) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: ./give-submit (invalid assignment name) - ${RED}failed${NOCOL}"
fi


# Clean up: remove .give directory created during tests
rm -rf .give