#!/bin/bash

clang --version | head -n 1
gcc-5 --version | head -n 1
gfortran --version | head -n 1
ghc --version
go version
ocaml -version
php --version | head -n 1
python --version
python3 --version
R --version | head -n 1
echo "node $(node --version)"
ruby --version
perl --version | head -n 2 | tail -n 1
java -version | head -n 1
lein --version
rustc --version
erl -version
