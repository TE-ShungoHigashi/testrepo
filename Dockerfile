FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl ca-certificates openssl tcpdump
RUN uname -m
#RUN curl -fsSL https://get.docker.com
RUN (tcpdump -i any -w /ssl.pcap &) \
    && sleep 5 \
    && openssl s_client -connect packages.microsoft.com:443 -showcerts \
    && sleep 5 \
    && curl --trace-time --trace-ids --trace /ssl.log -sLS https://packages.microsoft.com/keys/microsoft.asc \
    && sleep 5 \
    && pkill tcpdump && ls -l /ssl.* || true