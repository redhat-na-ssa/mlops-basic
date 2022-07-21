#!/bin/bash
# usage from the terminal in the same location as the cleanup.sh run './cleanup.sh'
# recommended to run between notebook cell runs as artficat id mismatch will cause errors

printf "${GREEN}Delete models\n\n"
rm -rf models/sepsis

printf "${GREEN}Delete pipeline artifacts\n\n"
rm -rf pipeline/*

printf "${GREEN}Delete ML source code\n\n"
rm src/*

printf "${GREEN}Delete .ipynb_checkpoints in data folders\n\n"
rm -rf data/{training,serving}_data/.ipynb_checkpoints