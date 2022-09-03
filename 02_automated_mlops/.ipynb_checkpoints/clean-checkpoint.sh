#!/bin/bash
# usage from the terminal in the same location as the cleanup.sh run './cleanup.sh'
# recommended to run between notebook cell runs as artficat id mismatch will cause errors

printf "${GREEN}Delete processed data\n\n"
rm -rf saved_data/*

printf "${GREEN}Delete .ipynb_checkpoints in data folders\n\n"
rm -rf saved_data/.ipynb_checkpoints

printf "${GREEN}Delete pipeline artifacts\n\n"
rm -rf pipelines/*

printf "${GREEN}Delete models artifacts\n\n"
rm -rf models/*

printf "${GREEN}Delete python code\n\n"
rm -rf ./{constants,trainer,transform}.py