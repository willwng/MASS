#!/usr/bin/env bash
# Build MASS (core + python binding + render) on this machine.
# Environment specifics baked in:
#   - DART 6.8 with gui component installed at ~/dart-6.8 (user prefix)
#   - pybind11 3.0.x from pip for python3.10
#   - build pinned to /usr/bin/python3.10 (which has GPU torch 2.11+cu128)
set -e
cd "$(dirname "$0")"

DART_DIR=/home/marth/dart-6.8/share/dart/cmake
PYBIND11_DIR=$(python3.10 -c "import pybind11; print(pybind11.get_cmake_dir())")

rm -rf build && mkdir build && cd build
cmake .. \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  -DDART_DIR="$DART_DIR" \
  -Dpybind11_DIR="$PYBIND11_DIR" \
  -DPYTHON_EXECUTABLE=/usr/bin/python3.10 \
  -DPython_EXECUTABLE=/usr/bin/python3.10 \
  -DPython3_EXECUTABLE=/usr/bin/python3.10
make -j"$(nproc)"
echo "Build complete. Binaries: python/pymss.so, build/render/render"
