#!/bin/bash
# Grokking & Weight Decay 实验
# 测试不同 weight decay 值对 grokking 现象的影响

set -xv

# 基础配置 - 使用小模型快速迭代
DEPTH=12
MAX_SEQ_LEN=512
DEVICE_BATCH_SIZE=8
TOTAL_BATCH_SIZE=32768
NUM_ITERATIONS=5000
EVAL_EVERY=100
CORE_METRIC_EVERY=500

# Weight decay 实验值
WD_VALUES=(0.0 0.01 0.05 0.1 0.2 0.5)

for WD in "${WD_VALUES[@]}"; do
    RUN_NAME="grokking_wd_${WD}"
    echo "Running experiment with weight_decay=${WD}"
    
    python -m scripts.base_train \
        --depth=${DEPTH} \
        --max-seq-len=${MAX_SEQ_LEN} \
        --device-batch-size=${DEVICE_BATCH_SIZE} \
        --total-batch-size=${TOTAL_BATCH_SIZE} \
        --num-iterations=${NUM_ITERATIONS} \
        --weight-decay=${WD} \
        --eval-every=${EVAL_EVERY} \
        --core-metric-every=${CORE_METRIC_EVERY} \
        --sample-every=-1 \
        --save-every=1000 \
        --run="${RUN_NAME}" \
        --model-tag="${RUN_NAME}"
done

echo "All experiments completed!"
