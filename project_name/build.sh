#!/bin/env bash

# Filter based on release or dev
if [[ "$1" == "release" ]]; then
	req_filter=$(ls ./requirements* | grep -v "dev")
	rdep_filter=$(ls ./r_packages* | grep -v "dev")
else
	req_filter=$(ls ./requirements*)
	rdep_filter=$(ls ./r_packages*)
fi

# install all python packages
for req_file in $req_filter
do
	pip3 install -r $req_file
done

# install all R packages
for rdep_file in $rdep_filter
do
	Rscript $rdep_file
done
