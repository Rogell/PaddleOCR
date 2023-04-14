FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04

RUN python -m pip install paddlepaddle-gpu==2.4.2.post116 -f https://www.paddlepaddle.org.cn/whl/linux/mkl/avx/stable.html
RUN pip install "paddleocr==2.6.0"

COPY requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt

WORKDIR /project
COPY . .
CMD ["bash"]
