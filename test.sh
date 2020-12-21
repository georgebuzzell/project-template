#!/bin/env bash

## PATH to test

## Variables
div="==="
fin_div="***"
cwd=$(pwd)
test_path="./project_name"

## Functions
run_test () {
	## Header
	echo -e "$div $2 $div\n"
	## evaluate a command string
	eval $1
	## Check exit code and provide information, exit on failure
	if [ $? -eq 0 ]
	then
		echo -e "$fin_div $3 passed $fin_div\n"
	else
		echo -e "$fin_div $3 failed $fin_div\n"
		## Exit on failure to fail on Travis-CI
		exit 1
	fi
}

# Switch to testing path
cd $test_path

## Check that code conforms to pep8 and passes linter
run_test "pycodestyle ./" "Checking code style" "Code style check"
run_test "pylint ./" "Running pylint on code" "Lint check"

## Run unit and integration tests
run_test "python -m unittest" "Running python tests" "Tests"

## Check R code using R lintr
run_test "" "Running R lintr on code" "Lint check"

## Return to cwd
cd $cwd

## Successful run
exit 0
