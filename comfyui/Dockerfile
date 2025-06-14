FROM ai-suite-base:latest

RUN git clone https://github.com/comfyanonymous/ComfyUI.git /comfyui

WORKDIR /comfyui

RUN uv pip install -r requirements.txt tensorrt onnx

# Install curl for health checks
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Install TensorRT
COPY optimize.py /comfyui
COPY startup.sh /comfyui

# Make startup script executable
RUN chmod +x /comfyui/startup.sh

ENTRYPOINT [ "/comfyui/startup.sh" ]