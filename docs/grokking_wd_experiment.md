# Grokking & Weight Decay 实验

## 实验目的
验证 Grokking 现象是否与 Weight Decay 相关。

## 实验设置 (v2 - 单卡快速迭代)
- **模型**: depth=6
- **序列长度**: 256
- **batch size**: device=16, total=4096
- **训练步数**: 2000
- **评估频率**: 每50步评估val loss, 每200步评估CORE metric

## 实验组 (v2)

| Job ID | Weight Decay | Run Name | 状态 |
|--------|-------------|----------|------|
| j-umaw6bdwja | 0.0 | grok_single_wd_0.0 | 运行中 |
| j-ao19tvz5od | 0.1 | grok_single_wd_0.1 | 运行中 |
| j-0cb56pyo1g | 0.2 | grok_single_wd_0.2 | 运行中 |

## WandB
- Project: grokking-wd-experiment
- Runs: grok_single_wd_0.0, grok_single_wd_0.1, grok_single_wd_0.2

## 预期观察
1. **如果 grokking 与 weight decay 相关**:
   - wd=0.0: 可能不出现 grokking，或 grokking 延迟
   - wd=0.2: 应该观察到经典 grokking 现象

2. **关键指标**:
   - train loss vs val loss 曲线
   - CORE metric 随训练步数的变化
   - 是否出现"先过拟合后泛化"的现象

## 集群信息
- 集群: PA (cls-7m5h2iul6q)
- 队列: minimax-dialogue-tide
- 镜像: harbor.xaminim.com/minimax-dialogue/nanochat-grokking:v2

## 历史实验 (v1 - 已废弃)
| Job ID | Weight Decay | 状态 |
|--------|-------------|------|
| j-o3rqx9p3ue | 0.0 | 废弃 |
| j-9dk5iojt7s | 0.1 | 废弃 |
| j-xitj4wwxjr | 0.2 | 废弃 |

## 提交时间
- v1: 2026-03-12
- v2: 2026-03-13
