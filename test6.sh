#!/bin/dash

# COMP2041/9044 Assignment1
# test6.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 7, 2024
#
# A test Script containing 3 more test for certain parts of give-add


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"


./give-add assignment1 multiply.sh multiply.autotests multiply.automarking > /dev/null

# test 04: invalid assignment name
expected_output="give-add: invalid assignment: Assignment1"
output=$(./give-add Assignment1 multiply.sh multiply.autotests multiply.automarking 2>&1)
echo "$output"
if [ "$output" = "$expected_output" ]; then
    echo "Test 04: give-add (invalid assignment name) - ${GREEN}passed${NOCOL}"
else
    echo "Test 04: give-add (invalid assignment name) - ${RED}failed${NOCOL}"
fi

# test 05: nonexistent file/directory
expected_output="give-add: abc.sh: No such file or directory"

output=$(./give-add assignment1 abc.sh multiply.autotests multiply.automarking 2>&1)

if [ "$output" = "$expected_output" ]; then
    echo "Test 05: give-add (nonexistent file/directory) - ${GREEN}passed${NOCOL}"
else
    echo "Test 05: give-add (nonexistent file/directory) - ${RED}failed${NOCOL}"
fi

# test 06: invalid solution
expected_output="give-add: s@lam.sh: No such file or directory"

output=$(./give-add assignment1 s@lam.sh multiply.autotests multiply.automarking 2>&1)

if [ "$output" = "$expected_output" ]; then
    echo "Test 06: give-add (invalid solution) - ${GREEN}passed${NOCOL}"
else
    echo "Test 06: give-add (invalid solution) - ${RED}failed${NOCOL}"
fi

# Clean up: remove .give directory created during tests
rm -rf .give