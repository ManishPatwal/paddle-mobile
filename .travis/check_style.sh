#!/bin/bash
function abort(){
    echo "Your change doesn't follow PaddlePaddle's code style" 1>&2
    echo "Please use pre-commit to auto-format your code." 1>&2
    exit 1
}

trap 'abort' 0
set -e
cd `dirname $0`
cd ..
export PATH=/usr/bin:$PATH
pre-commit install
clang-format --version

if ! pre-commit ; then
  ls -lh
  git diff  --exit-code
  exit 1
fi

trap : 0
