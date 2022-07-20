# Basic MLOps using Tensorflow Extended on OpenShift

## Goal
Demonstrate a basic Tensorflow Pipeline that automatically executes tasks from ingestion to serving. 

## Scenario
Uses sythentically generated patient data (Heart Rate, Temperature, Respiratory Rate, White Blood Cell Count) that has been labelled with a 1 (Septic) or 0 (Not-Septic).

```commandline
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── labelled       <- Input data synthentically generated labelled training examples.
│   ├── unlabelled     <- Input data 0synthentically generated unlabelled examples.
│   ├── data_file.txt  <- Input file containing information about the data.
│   └── septic_data_generator.csv  <- Conditions used for algorithms that generated the data.
│
├── docs               <- Input directory A default Sphinx project; see sphinx-doc.org for details
│
├── models             <- Output directory for trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Input directory Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── pipeline           <- Output directory to store artifacts generated from the pipeline.
│   └── metadata       <- Output directory to a SQLite DB file to use as an MLMD storage.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── setup.py           <- Make this project pip installable with `pip install -e`
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations
│       └── visualize.py
│
└── tox.ini            <- tox file with settings for running tox; see tox.readthedocs.io
```