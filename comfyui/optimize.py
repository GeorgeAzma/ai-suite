# Optimized image-gen model using TensorRT nodes inside ComfyUI workflow

import json
from urllib import request

workflow = """{
    "1": {
        "inputs": {
            "filename_prefix": "tensorrt/ComfyUI_STAT",
            "batch_size_opt": 1,
            "height_opt": 1024,
            "width_opt": 1024,
            "context_opt": 1,
            "num_video_frames": 1,
            "model": [
                "2",
                0
            ]
        },
        "class_type": "STATIC_TRT_MODEL_CONVERSION",
        "_meta": {
            "title": "STATIC_TRT_MODEL_CONVERSION"
        }
    },
    "2": {
        "inputs": {
            "ckpt_name": "waiNSFWIllustrious_v140.safetensors"
        },
        "class_type": "CheckpointLoaderSimple",
        "_meta": {
            "title": "Load Checkpoint"
        }
    }
}"""

try:
    prompt = json.loads(workflow)

    data = json.dumps({"prompt": prompt}).encode("utf-8")
    req = request.Request("http://127.0.0.1:8188/prompt", data=data)
    request.urlopen(req)
except FileNotFoundError:
    print("tensorrt.json not found")
    exit(1)
except json.JSONDecodeError:
    print("Invalid JSON in tensorrt.json")
    exit(1)
