#!/usr/bin/env bash

# Usage: ./build_zlib.sh <install_path>
# Example: ./build_zlib.sh /opt/zlib

INSTALL_PREFIX=${1} 

ZLIB_VERSION="1.3.1"
ZLIB_DIR="zlib-$ZLIB_VERSION"

# Download if not already
if [ ! -d "$ZLIB_DIR" ]; then
  curl -sLO https://zlib.net/fossils/$ZLIB_DIR.tar.gz
  tar -xzf $ZLIB_DIR.tar.gz && rm $ZLIB_DIR.tar.gz
fi

# Configure & build
cmake -S $ZLIB_DIR -B build -G "Visual Studio 17 2022" \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX="$INSTALL_PREFIX" 
cmake --build build --config Release --parallel
cmake --install build --config Release
