#!/bin/bash

# Verify
sudo docker run hello-world

hwinfo --display

sudo clinfo | grep "Driver Version"

sudo docker run -it --rm --device /dev/dri/renderD128 --group-add="$(stat -c "%g" /dev/dri/renderD128)" openvino/ubuntu22_dev samples/cpp/samples_bin/samples_bin/hello_query_device