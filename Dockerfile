FROM ubuntu:14.10
MAINTAINER Diego Perez <eazel7@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -q -y git curl build-essential python software-properties-common
RUN apt-add-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -q -y nodejs

RUN git clone https://github.com/c9/core.git /c9sdk
WORKDIR /c9sdk
RUN scripts/install-sdk.sh

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
