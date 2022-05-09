FROM csighub.tencentyun.com/grpc/grpc-go:latest

# docker build --build-arg SERVER_NAME="xxx"
ARG SERVER_NAME='please set server name'

ENV SERVER_NAME ${SERVER_NAME}

ADD tmp/${SERVER_NAME} tmp/*.yaml* /app/bin/
ADD tmp/assets/ /app/bin/assets/
RUN ln -nsf /app/logs /app/bin/logs
RUN mkdir -p /app/polaris_logs && ln -nsf /app/polaris_logs /app/bin/polaris_logs