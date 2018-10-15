#! /bin/bash

apt-get update && apt-get install -y curl
curl http://download.geteventstore.com/binaries/EventStore-OSS-Ubuntu-v__EVENTSTORE_VERSION__.tar.gz | tar xz -C /opt    
  