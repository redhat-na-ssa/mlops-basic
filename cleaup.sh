#!/bin/bash
# usage from the terminal in the same location as the cleanup.sh run './cleanup.sh'

printf "${GREEN}Delete models\n\n"
rm -rf models/sepsis_pipeline

printf "${GREEN}Delete pipeline artifacts\n\n"
rm -rf pipeline/train_pipeline

printf "${GREEN}Delete ML source code\n\n"
rm src/{pipeline.py,training_code.py}