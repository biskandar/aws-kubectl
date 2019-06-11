FROM python:alpine
MAINTAINER Benny Iskandar <benny.iskandar@gmail.com>

RUN apk --no-cache add curl
ADD run.sh /run.sh

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
	&& mv kubectl /usr/local/bin \
	&& chmod +x /usr/local/bin/kubectl

RUN adduser -S benny
USER benny
WORKDIR /home/benny
ENV PATH /usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/benny/.local/bin

# Install awscli
RUN pip install awscli --upgrade --user
