#!/usr/bin/env bash

# databricks configure --token  {PLACE YOUR TOKEN HERE}
# dbfs mkdirs dbfs:/databricks/init/{clusterName}
# dbfs rm dbfs:/databricks/init/{clusterName}/autosklearn.sh
# dbfs cp autosklearn.sh dbfs:/databricks/init/{clusterName}/autosklearn.sh
# dbfs ls dbfs:/databricks/init/{clusterName}/

# https://automl.github.io/auto-sklearn/stable/installation.html#installation
# https://raw.githubusercontent.com/automl/auto-sklearn/master/requirements.txt
# Example: https://docs.databricks.com/_static/notebooks/cntk-init-script.html

echo "Running apt-get upgrade"
apt-get upgrade

echo "Installing Dependencies"
apt-get -y install \
    ca-certificates \
    curl \
    build-essential \
    libpcre3-dev \
    swig

curl https://raw.githubusercontent.com/automl/auto-sklearn/master/requirements.txt | xargs -n 1 -L 1 pip install

echo "auto-sklearn"
pip install auto-sklearn

