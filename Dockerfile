FROM nvcr.io/nvidia/pytorch:24.02-py3

WORKDIR /app

RUN git clone https://github.com/hiyouga/LLaMA-Factory.git . && git checkout v0.6.3

RUN pip install -r requirements.txt

RUN pip install -e .[deepspeed,metrics,bitsandbytes,qwen,modelscope,tiktoken,auto_gptq,transformers_stream_generator,flash-attention,rich]

CMD [ "python", "src/train_web.py" ]
