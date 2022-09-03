# Basic MLOps using Tensorflow Extended on OpenShift

In this notebook-based tutorial, we will manually train a model as well as automate and advance the tasks with TFX pipelines to train a model to predict septic patients based on biological markers. The pipeline will consist of three essential TFX components: ExampleGen, Trainer and Pusher. The pipeline includes the most minimal ML workflow like importing data, training a model and exporting the trained TFRS ranking model.

## Goal
Demonstrate a basic Tensorflow Pipeline that automatically executes tasks from ingestion to serving. 

## Scenario
Uses sythentically generated patient data (Heart Rate, Temperature, Respiratory Rate, White Blood Cell Count) that has been labelled with a 1 (Septic) or 0 (Not-Septic).

```
├── 01_manual_ml
│   ├── basic_notebook_tfdf.ipynb             for manual ML development, run this notebook
│   └── models
├── 02_automated_mlops
│   ├── clean.sh
│   ├── constants.py
│   ├── mlops_notebook_tfx_tfdf.ipynb         for automating ML development, run this notebook
│   ├── models
│   ├── pipelines
│   ├── saved_data
│   ├── trainer.py
│   └── transform.py
├── data
│   ├── data_file
│   ├── serving_data
│   └── training_data
├── docs
│   ├── kfdef.yaml
│   ├── README.md
│   └── tensorboard_logs
├── README.md
└── requirements.txt                          always run 'pip install -r requirements.txt on first launch'
```