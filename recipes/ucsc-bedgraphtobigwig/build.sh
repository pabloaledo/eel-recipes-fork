#!/bin/bash

mkdir -p "$PREFIX/bin"
export BINDIR=$(pwd)/bin
export CFLAGS+=" -O3 -mcpu=neoverse-n1 "
export CPPFLAGS+=" -O3 -mcpu=neoverse-n1 "
mkdir -p "$BINDIR"

export L="${LDFLAGS}"

(cd kent/src/lib && make)
(cd kent/src/htslib && make)
(cd kent/src/jkOwnLib && make)
(cd kent/src/hg/lib && make)
(cd kent/src/utils/bedGraphToBigWig && make)

cp bin/bedGraphToBigWig "$PREFIX/bin"
chmod +x "$PREFIX/bin/bedGraphToBigWig"
