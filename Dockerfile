FROM ubuntu:20.04

ARG PRV_KEY
ARG PUB_KEY

RUN apt-get update && \
    apt-get install python3 python3-pip -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install ssh -y && \
    apt-get install sshpass && \  
    pip install -U isort codecov pylint pytest 

RUN mkdir /root/.ssh && \ 
    echo "$PRV_KEY" > /root/.ssh/id_rsa && \
    echo "$PUB_KEY" > /root/.ssh/id_rsa.pub && \
    chmod 700 /root/.ssh && chmod 600 /root/.ssh/id_rsa && chmod 644 /root/.ssh/id_rsa.pub   

