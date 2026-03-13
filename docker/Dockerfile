FROM harbor.xaminim.com/minimax/vllm_qwen3vl@sha256:4452342bd84847a15be5a95b7545458806ecc888fa9e648c3a86a8466156e918

RUN proxy="http://pac-internal.xaminim.com:3129" && \
    export https_proxy=$proxy && \
    export http_proxy=$proxy && \
    export ftp_proxy=$proxy && \
    export no_proxy="localhost,127.0.0.1,*.xaminim.com,10.0.0.0/8" && \
    pip install datasets>=4.0.0 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install wandb>=0.21.3 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install tiktoken>=0.11.0 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install tokenizers>=0.22.0 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install transformers>=4.57.3 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install zstandard>=0.25.0 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install rustbpe>=0.1.0 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install regex>=2025.9.1 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install scipy>=1.15.3 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install tabulate>=0.9.0 -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install psutil>=7.1.0 -i https://mirrors.aliyun.com/pypi/simple/

RUN unset https_proxy && \
    unset http_proxy && \
    unset ftp_proxy && \
    unset no_proxy

COPY . /app/nanochat

WORKDIR /app/nanochat

ENV PYTHONPATH=/app/nanochat

CMD ["bash"]
