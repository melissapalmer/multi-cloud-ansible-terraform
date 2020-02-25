FROM python:buster

ENV TIME_ZONE Africa/Johannesburg

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y graphviz

ENV ANSIBLE_VERSION 2.9.0
RUN pip install --upgrade pip ansible=="$ANSIBLE_VERSION"

ENV TERRAFORM_VERSION 0.12.13
ADD https://releases.hashicorp.com/terraform/"$TERRAFORM_VERSION"/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip /usr/local/bin/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip
RUN unzip -q -d /usr/local/bin /usr/local/bin/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip && \
    chmod +x /usr/local/bin/terraform && \
    rm -f /usr/local/bin/terraform_"$TERRAFORM_VERSION"_linux_amd64.zip

