#!/bin/dash

# COMP2041/9044 Assignment1
# test3.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 7, 2024
#
# A test Script containing 3 test for give-status


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"


# test 01: no submissions for the zid
expected_output="no submissions for z5393518"
output=$(./give-status z5393518 2>&1)
if [ "$output" = "$expected_output" ]; then
    echo "Test 01: ./give-status (no submissions) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: ./give-status (no submissions) - ${RED}failed${NOCOL}"
fi

# adding the assignment1 
./give-add assignment1 multiply.sh multiply.autotests multiply.automarking > /dev/null
# adding one submissions for one student
./give-submit assignment1 z5393518 multiply_wrong.sh > /dev/null


# test 02: status for 1 student
expected_output="* 1 submission for assignmen1
submission 1: multiply_wrong.sh 42 bytes @"
output="$(./give-status z5393518)"
if echo "$output" | grep -q -E "$expected_output"; then
    echo "Test 02: ./give-status (status for 1 student) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: ./give-status (status for 1 student) - ${RED}failed${NOCOL}"
fi

# adding one more submission for the student
./give-submit assignment1 z5393518 multiply_wrong.sh > /dev/null


# test 03: status for 2 student
expected_output="* 1 submission for assignmen1
submission 1: multiply_wrong.sh 42 bytes @
submission 2: multiply_wrong.sh 42 bytes @"
output="$(./give-status z5393518)"
if echo "$output" | grep -q -E "$expected_output"; then
    echo "Test 03: ./give-status (status for 2 student) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: ./give-status (status for 2 student) - ${RED}failed${NOCOL}"
fi


# Clean up: remove .give directory created during tests
rm -rf .give