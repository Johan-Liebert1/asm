#!/bin/bash

set -u

mkdir -p bin

file_name_wo_ext=$(echo $1 | awk  -F '.' '{print $1}')

nasm -f elf64 -o ./bin/$file_name_wo_ext.o $1
ld ./bin/$file_name_wo_ext.o -o ./bin/$file_name_wo_ext

./bin/$file_name_wo_ext
