#! /bin/bash

build=$1
if [[ $build = "" ]];then
  echo "populate-eventstore-build: build number required as first parameter"
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
sed -ie "s|__DEBIAN_CONTAINER__|$debian_container|g" ${this_directory}/build/Dockerfile

cp ${this_directory}/template.install.sh ${this_directory}/build/install.sh

docker build --no-cache -t $gcloud_container ${this_directory}/build/.
docker tag $gcloud_container $gcloud_container.$build
