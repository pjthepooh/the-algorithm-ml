FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3 python3-pip

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

COPY images images

RUN python -m pip install --upgrade pip
RUN pip3 install --no-deps -r images/requirements.txt

# These installed libraries require suppoted CPU instructions.
# For local docker with host machine arm64, need to re-install ones with compatitability
RUN pip uninstall -y torch torchrec fbgemm_gpu
RUN pip install torch==1.13.1 --extra-index-url https://download.pytorch.org/whl/cpu
RUN pip install torchrec==0.3.2

WORKDIR /usr/src/app
