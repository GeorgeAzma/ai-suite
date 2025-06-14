FROM nvidia/cuda:12.8.0-runtime-ubuntu24.04

# Install Dependencies
RUN apt update && apt install software-properties-common git wget -y
# Install Python 3.12 and pip
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt install python3.12 python3-pip python3-venv  -y
RUN ln -sf /usr/bin/python3.12 /usr/bin/python3

# Create a virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install Pytorch
RUN pip install uv
RUN uv pip install torch==2.6.0 torchvision==0.21.0 torchaudio==2.6.0 --extra-index-url https://download.pytorch.org/whl/cu126

# Cleanup
RUN rm -rf /var/lib/apt/lists/*