FROM nvcr.io/nvidia/pytorch:24.03-py3

WORKDIR /app

RUN git clone https://github.com/hiyouga/LLaMA-Factory.git . && git checkout v0.6.3

RUN pip install -r requirements.txt

RUN pip install deepspeed metrics bitsandbytes modelscope tiktoken auto_gptq qwen \
    transformers_stream_generator flash-attention typing-extensions rich pygments -U

EXPOSE 7860

CMD [ "python", "src/train_web.py" ]
