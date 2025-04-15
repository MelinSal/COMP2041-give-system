#!/bin/dash

# COMP2041/9044 Assignment1
# test5.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 7, 2024
#
# A test Script containing 3 test for give-rm


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"

# adding the assignment1 
./give-add assignment1 multiply.sh multiply.autotests multiply.automarking > /dev/null
# submiting multiply_wrong.sh
./give-submit assignment1 z5393518 multiply_wrong.sh > /dev/null



# test 01: removig the assignemnt successfully
expected_output="assignment assignment1 removed"
output="$(./give-rm assignment1)"
if [ "$output" = "$expected_output" ]; then
    echo "Test 01: ./give-rm (removing successfully) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: ./give-rm (removing successfully) - ${RED}failed${NOCOL}"
fi


# test 02: invalid assignment name
expected_output="give-rm: invalid assignment: Assignment1"
output="$(./give-rm Assignment1 2>&1)"
if [ "$output" = "$expected_output" ]; then
    echo "Test 02: ./give-rm (invalid assignment name) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: ./give-rm (invalid assignment name) - ${RED}failed${NOCOL}"
fi


# test 03: assignment not found 
expected_output="give-rm: assignment assignment1 not found"
output="$(./give-rm assignment1 2>&1)"
if [ "$output" = "$expected_output" ]; then
    echo "Test 03: ./give-rm (assignment not found ) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: ./give-rm (assignment not found ) - ${RED}failed${NOCOL}"
fi


# Clean up: remove .give directory created during tests
rm -rf .give