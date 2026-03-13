#!/bin/bash
# 单卡 Grokking & Weight Decay 快速实验
# 更小的模型和batch size以加快迭代

set -xv
cd /minimax-dialogue/workspace/users/walker/nanochat

# 设置wandb使用独立project
export WANDB_PROJECT="grokking-wd-experiment"

# 基础配置 - 小模型快速迭代
DEPTH=6
MAX_SEQ_LEN=256
DEVICE_BATCH_SIZE=16
TOTAL_BATCH_SIZE=4096
NUM_ITERATIONS=2000
EVAL_EVERY=50
CORE_METRIC_EVERY=200

# Weight decay 实验值
WD=$1
if [ -z "$WD" ]; then
    WD=0.2
fi

RUN_NAME="grok_single_wd_${WD}"
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
    --save-every=-1 \
    --run="${RUN_NAME}" \
    --model-tag="${RUN_NAME}"

echo "Experiment with WD=${WD} completed!"
