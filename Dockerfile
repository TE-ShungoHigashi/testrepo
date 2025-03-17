FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl ca-certificates openssl
RUN uname -m
#RUN curl -fsSL https://get.docker.com
RUN openssl s_client -connect packages.microsoft.com:443 -showcerts \
    && sleep 5 \
    && echo ========================================================= \
    && curl --trace-time --trace-ids --trace - -sLS https://packages.microsoft.com/keys/microsoft.asc