Host lots of useful AI services easily
### Features
- chat-interface
- image-gen (x2 faster using tensorrt)
- speech-to-text
- text-to-speech
- local models via ollama
- external models via openai compatible APIs
- cloudflare (sub)domain hosting
- run easily via docker
### What This Does
- downloads and serves open-webui at http://chat.example.com:8080
- downloads and serves comfy-ui at http://image.example.com:8188
- serves text-to-speech at http://tts.example.com:5000
- serves speech-to-text at http://stt.example.com:5001
- stores ollama/open-webui/comfyui data
### How To Run
1. purchase and setup cloudflare domain
2. install cloudflared
3. `cloudflared login`
4. `cloudflared tunnel create <tunnel-name>`
5. create `.env`
``` env
WEBUI_SECRET_KEY="anything-works"
TUNNEL_NAME="<tunnel-name>"
DOMAIN_NAME="example.com"
```
1. go to `~/.cloudflared/` or `C:\Users\<user>\.cloudflared`
2. copy everything to `cloudflare/` but rename json file to `credentials.json`
3. `cloudflared tunnel route dns <tunnel-name> chat.example.com`
4. `cloudflared tunnel route dns <tunnel-name> image.example.com`
5. `cloudflared tunnel route dns <tunnel-name> tts.example.com`
6. `cloudflared tunnel route dns <tunnel-name> stt.example.com`
7. `cloudflared tunnel route dns <tunnel-name> example.com`
8. `docker compose up` and wait for everything to download
9. go-to `example.com` to see main chat-interface

### Downloads
#### Models
- `6.6 GB` anime image model `waiNSFWIllustrious_v140`
- `2.1 GB` TTS model `chatterbox`
- `2.5 GB` STT model `parakeet-v2`
Total `11 GB` (optional)
#### Images
- `9.3 GB` comfyui
- `5.1 GB` ollama
- `4.2 GB` stt
- `2.5 GB` open-webui
- `0.7 GB` tts
- `0.1 GB` alpine, cloudflared
Total `22 GB`

### Storage
- `22  GB` Downloads
- `5.2 GB` TensorRT Optimized Model
- `2 GB` Containers
Total `30 GB`

### Prerequisites
- Docker
- cloudflare account 
- cloudflare domain name
- cloudflared.exe installed
- 30+ GB free storage
- 8+ GB VRAM recommended
- 8+ GB RAM recommended