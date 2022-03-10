#!/bin/bash 


set -e

LLVM_HOME=/root/tools/llvm-home
CC=$LLVM_HOME/bin/clang
LD=$LLVM_HOME/bin/llvm-link

alias llvm-link="$LLVM_HOME/bin/llvm-link"

cp ./allyesconfig ./linux-5.3/.config

pushd ./linux-5.3

#make CC=$LLVM_HOME/bin/clang CONFIG_BUILD_LLVM=1 allyesconfig
#make CC=$LLVM_HOME/bin/clang CONFIG_BUILD_LLVM=1 menuconfig

make CC=$LLVM_HOME/bin/clang LD=$LLVM_HOME/bin/llvm-link CONFIG_BUILD_LLVM=1 -j8

popd
