#!/bin/bash


podman run --rm --security-opt=label=disable \
  --hooks-dir=/usr/share/containers/oci/hooks.d/ \
  -p 10001:8001 \
  -v $PWD/models:/model \
  --rm \
  moyix/triton_with_ft:22.09 \
  mpirun -n 1 --allow-run-as-root /opt/tritonserver/bin/tritonserver --model-repository=/model
