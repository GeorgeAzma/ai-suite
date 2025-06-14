#!/bin/bash

# Install image-gen model
if [ ! -f /comfyui/models/checkpoints/waiNSFWIllustrious_v140.safetensors ]; then
    echo "Downloading waiNSFWIllustrious_v140.safetensors image-gen model..."
    wget -O /comfyui/models/checkpoints/waiNSFWIllustrious_v140.safetensors "https://civitai.com/api/download/models/1761560?type=Model&format=SafeTensor&size=pruned&fp=fp16";
fi

if [ ! -d "/comfyui/custom_nodes/comfyui_tensorrt" ]; then
    echo "Installing TensorRT custom node..."
    git clone https://github.com/comfyanonymous/ComfyUI_TensorRT.git /comfyui/custom_nodes/comfyui_tensorrt
    cd /comfyui/custom_nodes/comfyui_tensorrt
    uv pip install -r requirements.txt
    cd /comfyui
fi

# Start ComfyUI in the background
python3 main.py --lowvram --disable-smart-memory --preview-size 256 --fast --listen 0.0.0.0 --port 8188 &
COMFY_PID=$!

# Function to check if ComfyUI is ready
check_comfy_ready() {
    curl -s http://127.0.0.1:8188/ > /dev/null 2>&1
    return $?
}

# Wait for ComfyUI to be ready
echo "Waiting for ComfyUI to start..."
while ! check_comfy_ready; do
    sleep 2
    echo "Still waiting..."
done
echo "ComfyUI API is ready to be called by TensorRT"

# Run TensorRT conversion
if [ ! -f '/comfyui/output/tensorrt/ComfyUI_STAT_$stat-b-1-h-1024-w-1024_00001_.engine' ]; then
    python3 optimize.py && echo "TensorRT conversion initiated"
fi

# Keep the ComfyUI process running in foreground
wait $COMFY_PID
