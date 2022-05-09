#!/bin/bash
set -e

cd $(dirname $0) || exit 1

if [[ -z "$SERVER_NAME" ]]; then
    echo "please set SERVER_NAME first, try SERVER_NAME=xxx sh build.sh"
    exit 1
fi

export GO111MODULE=on
export GOOS=linux

rm -rf ./tmp && mkdir ./tmp

go mod tidy
go build -o tmp/$SERVER_NAME ../cmd/$SERVER_NAME

# 通过开关看要不要把指定环境的grpc.yaml打包到镜像里
if [[ -f "../cmd/$SERVER_NAME/config/grpc.yaml" ]]; then
    echo "cp ../cmd/$SERVER_NAME/config/*.yaml"
    cp ../cmd/$SERVER_NAME/config/*.yaml tmp/
fi

mkdir tmp/assets
cp -rf assets tmp/assets
## 支持自定义assets目录
if [[ -d ./services/${SERVER_NAME}/assets/ ]]; then
    echo "cp ./services/${SERVER_NAME}/assets/"
    cp -rf ./services/${SERVER_NAME}/assets/* tmp/assets/
fi