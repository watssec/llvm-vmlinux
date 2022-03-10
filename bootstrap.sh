#!/bin/bash

set -euxo 

if [ ! -d llvm-project ]; then

git submodule update --init --recursive

fi

# wget 

if [ ! -d linux-5.3 ]; then

wget https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.3.tar.gz
tar xzf linux-5.3.tar.gz

fi

# patch

cp -r ./makefiles/linux-5.3-makefiles/* ./linux-5.3/

# build llvm

pushd llvm-project
mkdir build
pushd build

cmake ../llvm -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;lld;polly" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=On -DLLVM_ENABLE_RTTI=On -DLLVM_ENABLE_EH=On -DLLVM_ENABLE_THREADS=On  

make -j16
popd
popd
