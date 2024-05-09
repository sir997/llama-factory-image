FROM nvcr.io/nvidia/pytorch:24.03-py3

WORKDIR /app

RUN git clone https://github.com/hiyouga/LLaMA-Factory.git . && git checkout v0.6.3

RUN pip install -r requirements.txt

RUN pip install deepspeed metrics bitsandbytes modelscope tiktoken auto_gptq  \
    transformers_stream_generator flash-attention -U

# RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple flash-attn --no-build-isolation -U
# RUN pip install flash-attn -U

# VOLUME [ "/root/.cache/huggingface/", "/app/data", "/app/output" ]
EXPOSE 7860

CMD [ "python", "src/train_web.py" ]
