#  Procedure

1. Created GitHub project
2. Applied a modified [Cookie Cutter Data Science Project](https://drivendata.github.io/cookiecutter-data-science/)
3. Accessed OpenShift 4.10 cluster on AWS
4. Installed  Open Data Hub Operator v1.2 (see kfdef.yaml)
5. Created OpenShift project "MLOps Basic"
6. Launched Jupyter Notebook with Elyra image
7. Cloned GitHub project into Jupyter Environment
8. Configured GitHub credentials via `git config --global user.name` and `git config --global user.email`
9. Generated labelled and unlabelled data using algorithms from data/data_file.txt and data/septic_data_generator.csv 
10. Developed training and pipeline code using Jupyter Notebook in notebooks/train_pipeline_notebook.ipynb
11. Query model with unlabelled data using BulkInferrer
12. Serve model with TFServing and curl requests

