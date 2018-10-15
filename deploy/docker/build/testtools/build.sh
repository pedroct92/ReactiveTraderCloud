#! /bin/bash

build=$1
if [[ $build = "" ]];then
  echo "servers-build: build number required as first parameter"
  exit 1
fi

# fail fast
set -euo pipefail

# load configuration
this_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
root_directory="${this_directory}/../../../.."
. ${root_directory}/deploy/config

mkdir -p ${this_directory}/build

cp ${this_directory}/template.Dockerfile ${this_directory}/build/Dockerfile

sed -ie "s/__UBUNTU_CONTAINER__/$ubuntu_container/g" ${this_directory}/build/Dockerfile
sed -ie "s/__JQ_VERSION__/$jq_version/g"                          ${this_directory}/build/Dockerfile

docker build --no-cache -t $testtools_container ${this_directory}/build/.
docker tag $testtools_container $testtools_container.$build
docker tag $testtools_container $testtools_container_latest
