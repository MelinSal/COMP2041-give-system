#!/bin/dash

# COMP2041/9044 Assignment1
# test4.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 7, 2024
#
# A test Script containing 3 test for give-fetch


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"

# adding the assignment1 
./give-add assignment1 multiply.sh multiply.autotests multiply.automarking > /dev/null
# submiting multiply_wrong.sh
./give-submit assignment1 z5393518 multiply_wrong.sh > /dev/null
# submiting multiply_right.py
./give-submit assignment1 z5393518 multiply_right.py > /dev/null
# submiting hello.sh
./give-submit assignment1 z5393518 hello.sh > /dev/null



# test 01: positive fetching
expected_output="#!/bin/dash
a=$1
read b
echo $((a * a))

"
output=$(./give-fetch assignment1 z5393518 1)
if echo "$output" | grep -q -E "$expected_output"; then
    echo "Test 01: ./give-fetch (positive fetching) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: ./give-fetch (positive fetching) - ${RED}failed${NOCOL}"
fi


# test 02: negative fetching
expected_output="#!/usr/bin/python3
import sys
a=int(sys.argv[1])
b=int(input())
print(a * b)
"
output=$(./give-fetch assignment1 z5393518 -1)
if echo "$output" | grep -q -E "$expected_output"; then
    echo "Test 02: ./give-fetch (negative fetching) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: ./give-fetch (negative fetching) - ${RED}failed${NOCOL}"
fi


# test 03: out of bound fetching
expected_output="give-fetch: submission 10 not found for assignment1"
output="$(./give-fetch assignment1 z5393518 10 2>&1)"
if [ "$output" = "$expected_output" ]; then
    echo "Test 03: ./give-fetch (out of bound fetching) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: ./give-fetch (out of bound fetching) - ${RED}failed${NOCOL}"
fi


# test 03: negative out of bound fetching
expected_output="give-fetch: submission -7 not found for assignment1"
output="$(./give-fetch assignment1 z5393518 -10 2>&1)"
if [ "$output" = "$expected_output" ]; then
    echo "Test 03: ./give-fetch (out of bound fetching) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: ./give-fetch (out of bound fetching) - ${RED}failed${NOCOL}"
fi


# Clean up: remove .give directory created during tests
rm -rf .give