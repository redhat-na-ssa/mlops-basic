# Model Serving with Tensorflow Serving

How to version models using TFS. This topic is very important because models usually change over time and you need a way to control the version that is live for most users while being able to work on newer versions. Other uses of this are canary deployment or A/B testing.
 
## Understanding models.config
You can specify the desired configuration for how you want TFS to host your model versions via the models.config file.

```commandline
model_config_list {
  config {
    name: 'animals'
    base_path: '/models/animals/'
    model_platform: 'tensorflow'
  }
}
```
- name: Stands for the name of your model. In this case it is `sepsis`.
- base_path: Stands for path where your model is going to be. Since you will use TFS with Podman you will set this path to /models/sepsis/.
- model_platform: Stands for the format of your model. In this case it is tensorflow.

By adding more information to this file you can customize things like which versions of the model are going to be served. You will be serving the 3 versions so you will need to add this within the config scope:

```commandline
    model_version_policy {
        specific {
            versions: 1658326344
            versions: 1658326734
            versions: 1658326835
          }
        }
```
Now all versions of the model will be served. This is cool but you still need to remember what every version is supposed to be. To account for this you can also define labels for each version by adding this:
```commandline
    version_labels {
        key: 'deprecated'
        value: 1658326344
    }
    version_labels {
        key: 'stable'
        value: 1658326734
    }
    version_labels {
        key: 'canary'
        value: 1658326835
    }
```
Now that you assigned labels it is much easier to remember what every version represents:

- Version 1658326344 was the first iteration of the model and yielded poor results and has been deprecated.
- Version 1658326734 is the stable version of the classifier.
- Version 1658326835 has some new features to yield better results than the stable version so it is used for canary deployment.

To check the whole file be sure to look at it within the serving directory.

# Containerize the model with Podman

```commandline
# pull the tensorflow image from docker.io
podman pull docker.io/tensorflow/serving:latest

#OPTION 1
docker run -t --rm  -p 8501:8501 \
--mount type=bind,source="$(pwd)/models",target=/models/ tensorflow/serving \
--model_config_file=/models/models.config \
--model_config_file_poll_wait_seconds=60 \
--allow_version_labels_for_unavailable_models=true


#OPTION 2

# run the tensorflow image as a base image
podman run -d --name serving_base tensorflow/serving:latest 

# copy over the model files to the container models subdirectory
podman cp models/. serving_base:/models

# verify the copy completed
podman exec serving_base ls -l models
podman exec serving_base cat models/models.config

# commit the changes
podman commit -m "moved over trained models" serving_base sepsis_base -f docker

# stop and remove the base container
podman rm -f serving_base

# run the new image
podman run -d --name sepsis -p 8501:8501 sepsis_base:latest --model_config_file=/models/models.config --model_config_file_poll_wait_seconds=60 --allow_version_labels_for_unavailable_models=true

# curl a request
curl -X POST http://0.0.0.0:8501/v1/models/sepsis_pipeline/versions/1658326734:predict -d @./data/training_data/septic_data_labelled.csv -H "Content-Type: application/json"


podman run -it --rm -p 8501:8501 \
--mount type=bind,source="$(pwd)/models",target=/models/ tensorflow/serving \
--model_config_file=serving/models.config \
--model_config_file_poll_wait_seconds=60 \
--allow_version_labels_for_unavailable_models=true
```
