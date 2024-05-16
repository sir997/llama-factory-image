FROM nvcr.io/nvidia/pytorch:24.02-py3

WORKDIR /app

RUN git clone https://github.com/hiyouga/LLaMA-Factory.git . && git checkout v0.6.3

RUN pip install -r requirements.txt

RUN pip install -e .[deepspeed,metrics,bitsandbytes,qwen,modelscope,tiktoken,auto_gptq,transformers_stream_generator,flash-attention,rich]

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y tzdata \
    && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/*

CMD [ "python", "src/train_web.py" ]
