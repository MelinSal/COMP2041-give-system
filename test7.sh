#!/bin/dash

# COMP2041/9044 Assignment1
# test7.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 7, 2024
#
# A test Script containing 3 more test for certain parts of give-submit


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"

./give-add assignment1 multiply.sh multiply.autotests multiply.automarking > /dev/null


# test 04: invalid zid
expected_output="give-submit: invalid zid: z539351"
output=$(./give-submit assignment1 z539351 multiply_wrong.sh 2>&1)
if [ "$output" = "$expected_output" ]; then
    echo "Test 04: ./give-submit (invalid zid) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: ./give-submit (invalid zid) - ${RED}failed${NOCOL}"
fi

# test 05: invalid filename
expected_output="give-submit: s@lam.sh: No such file or directory"
output=$(./give-submit assignment1 z5393518 s@lam.sh 2>&1)
if [ "$output" = "$expected_output" ]; then
    echo "Test 05: ./give-submit (invalid filename) - ${GREEN}passed${NOCOL}"
else
    echo "Test 05: ./give-submit (invalid filename) - ${RED}failed${NOCOL}"
fi

# test 06: successfull submission
expected_output="Submission accepted - submission 1: multiply_wrong.sh 42 bytes"
output=$(./give-submit assignment1 z5393518 multiply_wrong.sh)
if echo "$output" | grep -q -E "$expected_output"; then
    echo "Test 06: ./give-submit (successfull submission) - ${GREEN}passed${NOCOL}"
else
    echo "Test 06: ./give-submit (successfull submission) - ${RED}failed${NOCOL}"
fi

# Clean up: remove .give directory created during tests
rm -rf .give