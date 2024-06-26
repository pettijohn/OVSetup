#!/bin/bash

# Verify
sudo docker run hello-world

hwinfo --display

sudo clinfo | grep "Driver Version"

# Need env variables to work around 6.8 kernel support issue https://github.com/intel/compute-runtime/issues/710
#sudo docker run -it --rm --device /dev/dri/renderD128 --group-add="$(stat -c "%g" /dev/dri/renderD128)" openvino/ubuntu22_dev samples/cpp/samples_bin/samples_bin/hello_query_device
docker run -it --rm --env NEOReadDebugKeys=1 --env OverrideGpuAddressSpace=48 --device /dev/dri/renderD128 --group-add="$(stat -c "%g" /dev/dri/renderD128)" openvino/ubuntu22_dev samples/cpp/samples_bin/samples_bin/hello_query_device