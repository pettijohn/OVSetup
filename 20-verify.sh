#!/bin/bash

# Verify
docker run hello-world

sudo apt install hwinfo clinfo -y
hwinfo --display

sudo clinfo | grep "Driver Version"

# Need env variables to work around 6.8 kernel support issue https://github.com/intel/compute-runtime/issues/710
#sudo docker run -it --rm --device /dev/dri/renderD128 --group-add="$(stat -c "%g" /dev/dri/renderD128)" openvino/ubuntu22_dev samples/cpp/samples_bin/samples_bin/hello_query_device
#docker run -it --rm --env NEOReadDebugKeys=1 --env OverrideGpuAddressSpace=48 --device /dev/dri/renderD128 --group-add="$(stat -c "%g" /dev/dri/renderD128)" openvino/ubuntu22_dev samples/cpp/samples_bin/samples_bin/hello_query_device

#docker run -d --name openvino --volume=.:/Code --env NEOReadDebugKeys=1 --env OverrideGpuAddressSpace=48 --device /dev/dri/ --group-add="$(stat -c "%g" /dev/dri/renderD128)" openvino/ubuntu22_dev 
#docker exec openvino bash

docker run -it --rm --device /dev/dri/renderD128 --group-add="$(stat -c "%g" /dev/dri/renderD128)" --entrypoint /opt/intel/openvino_2024.6.0.0/samples/cpp/samples_bin/samples_bin/hello_query_device openvino/ubuntu24_dev:latest

