#!/usr/bin/env bash
# Run MASS training. Uses python3.10 (where GPU torch 2.11+cu128 is installed).
# Usage: ./train.sh                 # train from scratch (uses GPU automatically)
#        ./train.sh -m 4            # resume from nn/4.pt
cd "$(dirname "$0")/python"
exec python3.10 main.py -d ../data/metadata.txt "$@"
