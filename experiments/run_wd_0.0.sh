#!/bin/bash
cd /minimax-dialogue/workspace/users/walker/nanochat
export WANDB_PROJECT="grokking-wd-experiment"

echo "===== Starting WD=0.0 ====="
python -m scripts.base_train \
    --depth=6 \
    --max-seq-len=256 \
    --device-batch-size=16 \
    --total-batch-size=4096 \
    --num-iterations=2000 \
    --weight-decay=0.0 \
    --eval-every=50 \
    --core-metric-every=200 \
    --sample-every=-1 \
    --save-every=-1 \
    --run="grok_single_wd_0.0" \
    --model-tag="grok_single_wd_0.0"
echo "===== WD=0.0 completed ====="
