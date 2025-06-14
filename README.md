Hosting Local AI chat-interface, image-gen, speech-to-text, text-to-speech
on your cloudflare subdomains with nice web UI
### What This Does
- downloads and serves open-webui at http://chat.example.com:8080
- downloads and serves comfy-ui at http://image.example.com:8188
- serves text-to-speech at http://tts.example.com:5000
- serves speech-to-text at http://stt.example.com:5001
- stores ollama/open-webui/comfyui data
- x2 faster image-gen speed using tensorrt for comfy-ui

### Subdomains
- http://example.com `hosts open-webui`
- http://chat.example.com `hosts open-webui`
- http://image.example.com `hosts comfy-ui`
- http://tts.example.com `hosts text-to-speech`
- http://stt.example.com `hosts speech-to-text`

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
1. go to `~/.cloudflared/`
2. copy everything to `cloudflare/` but rename json file to `credentials.json`
3. `cloudflared tunnel route dns <tunnel-name> chat.example.com`
4. `cloudflared tunnel route dns <tunnel-name> image.example.com`
5. `cloudflared tunnel route dns <tunnel-name> tts.example.com`
6. `cloudflared tunnel route dns <tunnel-name> stt.example.com`
7. `cloudflared tunnel route dns <tunnel-name> example.com`
8. `docker compose up` and wait for everything to download
9. `(optional)` download local models via `ollama run <model-name>`
  (get model names from `ollama.com/library`)
10. update open-webui settings to make img-gen/tts/stt work

### Downloads
- `6.6 GB` anime image model `waiNSFWIllustrious_v140`
- `2.1 GB` TTS model `chatterbox`
- `2.5 GB` STT model `parakeet-v2`
- `2.1 GB` CUDA runtime image
- `3.2 GB` torch with CUDA
- `100 MB` alpine, cloudflared image

### Prerequisites
- Docker
- cloudflare account 
- cloudflare domain name
- cloudflared.exe installed
- 25+ GB free storage
- 8+ GB VRAM recommended
- 8+ GB RAM recommended