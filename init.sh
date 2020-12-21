#!/bin/env bash

project_name=$1

file_paths=("docker/Dockerfile" "docker/Dockerfile.dev" "docker-compose.yaml" "test.sh"
	"github/workflows/python_ci.yaml")

for path in ${file_paths[*]}; do
	sed -i -Ee "s/project_name/"$project_name"/g" $path
done

rm -rf .git
mv project_name $project_name
mv workflows .github/
