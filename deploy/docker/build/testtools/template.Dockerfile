FROM            __UBUNTU_CONTAINER__
MAINTAINER 	    weareadaptive <thibault@weareadaptive.com>

WORKDIR /root
RUN     apt-get update && apt-get install curl -y
RUN     curl --silent -L -o jq https://github.com/stedolan/jq/releases/download/jq-__JQ_VERSION__/jq-linux64
RUN     chmod 755 jq

RUN     mkdir /test
WORKDIR /test

ENV     PATH  $PATH:/root

CMD     curl
