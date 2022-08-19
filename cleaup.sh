#!/bin/bash
# usage from the terminal in the same location as the cleanup.sh run './cleanup.sh'
# recommended to run between notebook cell runs as artficat id mismatch will cause errors

printf "${GREEN}Delete models\n\n"
rm -rf models/*

printf "${GREEN}Delete transformed data\n\n"
rm -rf data/transformed_data/*

printf "${GREEN}Delete pipeline artifacts\n\n"
rm -rf pipelines/*

printf "${GREEN}Delete ML source code\n\n"
rm src/*

printf "${GREEN}Delete .ipynb_checkpoints in data folders\n\n"
rm -rf data/{training,serving}_data/.ipynb_checkpoints
