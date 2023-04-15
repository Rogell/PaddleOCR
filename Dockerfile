FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y software-properties-common curl
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install -y python3.9 python3.9-dev python3.9-distutils python3.9-venv
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py

RUN python3.9 -m pip install paddlepaddle-gpu==2.4.2.post116 -f https://www.paddlepaddle.org.cn/whl/linux/mkl/avx/stable.html
RUN python3.9 -m pip install "paddleocr==2.6.0"

COPY requirements.txt /opt/requirements.txt
RUN python3.9 -m pip install -r /opt/requirements.txt

WORKDIR /project
COPY . .
CMD ["bash"]
