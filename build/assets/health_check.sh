#!/bin/bash

/bin/grpc_health_probe "--addr=:${SERVER_PORT}"