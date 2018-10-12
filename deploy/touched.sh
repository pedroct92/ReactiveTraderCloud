#! /bin/bash

set -e

TARGET=develop
COMMIT=$(git rev-parse $TARGET)
if [[ $(echo $CIRCLE_BRANCH | grep -E "(master|develop)") != "" ]]; then
    COMMIT="@"
fi;

echo "Comparing from $TARGET $COMMIT"

export BUILD_LIST=(web)
export LOAD_LIST=()
export RUN_LIST=(web)
export PULL_LIST=()
export TOUCHED_FILES=$(git diff --name-only --diff-filter=ADMR $COMMIT~..@)

[[ $(echo $TOUCHED_FILES | grep "^src/server") != "" ]] && \
    export SERVER_TOUCHED=1 || export SERVER_TOUCHED=0

[[ $(echo $TOUCHED_FILES | grep -E "(^src/client|/web)") != "" ]] && \
    export CLIENT_TOUCHED=1 || export CLIENT_TOUCHED=0

if [[ $(echo $TOUCHED_FILES | grep "^src/server") != "" ]]; then
    LOAD_LIST+=("dotnet" "crossbar" "eventstore")
    LOAD_LIST+=("dotnet" "crossbar" "eventstore")
    BUILD_LIST+=("servers" "broker" "populatedEventstore")
    RUN_LIST+=("eventstore" "broker" "referencedataread" "pricing" "tradeexecution" "blotter" "analytics")
fi;

# if [[ $(echo $TOUCHED_FILES | grep -E "(^src/client|/web)") != "" ]]; then
#     BUILD_LIST+=("web")
#     RUN_LIST+=("web")
# fi
