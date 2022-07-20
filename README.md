# Basic MLOps using Tensorflow Extended on OpenShift

In this notebook-based tutorial, we will create and run a TFX pipeline to train a model to predict septic patients based on biological markers. The pipeline will consist of three essential TFX components: ExampleGen, Trainer and Pusher. The pipeline includes the most minimal ML workflow like importing data, training a model and exporting the trained TFRS ranking model.

## Goal
Demonstrate a basic Tensorflow Pipeline that automatically executes tasks from ingestion to serving. 

## Scenario
Uses sythentically generated patient data (Heart Rate, Temperature, Respiratory Rate, White Blood Cell Count) that has been labelled with a 1 (Septic) or 0 (Not-Septic).

```commandline
├── LICENSE
├── README.md                          <- The top-level README for developers using this project.
├── data
│   ├── serving_data                   <- Input data synthentically generated unlabelled serving examples.
│   ├── training_data                  <- Input data synthentically generated labelled training examples.
│   └── data_file                      <- Input directory containing information about the data.
│       ├── data_file.txt              <- Input file containing information about the data.
│       └── septic_data_generator.csv  <- Generation file containing conditions used for algorithms that generated the data.
│
├── docs               <- Input directory containing the kfdef file used to deploy Open Data Hub
│
├── models             <- Output directory for trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Input directory Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── pipeline           <- Output directory to store artifacts generated from the pipeline.
│   ├── metadata       <- Output directory to a SQLite DB file to use as an MLMD storage.
│   └── train_pipeline <- Output directory to store artifacts generated from the pipeline.
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
└── src                <- Source code for use in this project.
    ├── __init__.py    <- Makes src a Python module
    └── visualization  <- Scripts to create exploratory and results oriented visualizations
```