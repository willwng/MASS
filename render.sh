#!/usr/bin/env bash
# Run the MASS visualizer. Needs ~/dart-6.8/lib on the loader path (transitive DART libs).
# Usage:
#   ./render.sh                                   # UI only (no policy)
#   ./render.sh nn/max.pt nn/max_muscle.pt        # replay a trained muscle policy
#   ./render.sh nn/max.pt                         # torque-actuated model
cd "$(dirname "$0")"
export LD_LIBRARY_PATH=/home/marth/dart-6.8/lib:$LD_LIBRARY_PATH
exec ./build/render/render data/metadata.txt "$@"
