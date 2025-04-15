#!/bin/dash

# COMP2041/9044 Assignment1
# test0.sh
#
# This program was written by Melina Salardini (z5393518)
# on july 7, 2024
#
# A test Script containing 3 test for certain parts of give-add


# color for the output
GREEN='\033[0;32m'
RED='\033[0;31m'
NOCOL='\033[0m'

PATH="$PATH:$(pwd)"

# test 01: valid inputs
expected_output="directory .give created
assignment assignment1 created"
output=$(./give-add assignment1 multiply.sh multiply.autotests multiply.automarking)
if [ "$output" = "$expected_output" ]; then
    echo "Test 01: give-add (valid input) - ${GREEN}passed${NOCOL}"
else
    echo "Test 01: give-add (valid input) - ${RED}failed${NOCOL}"
fi


# test 02: adding already existing assignment
expected_output="give-add: assignment assignment1 already exists"

output=$(./give-add assignment1 multiply.sh multiply.autotests multiply.automarking 2>&1)

if [ "$output" = "$expected_output" ]; then
    echo "Test 02: give-add (already exisiting assignment) - ${GREEN}passed${NOCOL}"
else
    echo "Test 02: give-add (already exisiting assignment) - ${RED}failed${NOCOL}"
fi

# test 03: missing arguments
expected_output="usage: give-add <assignment> <solution> <autotests> <automarking>"

output=$(./give-add 2>&1)

if [ "$output" = "$expected_output" ]; then
    echo "Test 03: give-add (missing args) - ${GREEN}passed${NOCOL}"
else
    echo "Test 03: give-add (missing args) - ${RED}failed${NOCOL}"
fi


# Clean up: remove .give directory created during tests
rm -rf .give