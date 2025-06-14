FROM ai-suite-base:latest

RUN uv pip install open-webui

ENTRYPOINT [ "open-webui", "serve", "--host", "0.0.0.0", "--port", "8080" ]