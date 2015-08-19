#!/bin/bash

clang --version | head -n 1
erl -version
gcc-5 --version | head -n 1
gfortran --version | head -n 1
go version
ghc --version
java -version | head -n 1
lein --version
echo "node $(node --version)"
ocaml -version
perl --version | head -n 2 | tail -n 1
php --version | head -n 1
python --version
python3 --version
R --version | head -n 1
ruby --version
rustc --version
