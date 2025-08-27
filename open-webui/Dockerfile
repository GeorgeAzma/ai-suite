FROM ai-suite-base:latest

RUN uv pip install open-webui && \
    rm -rf ~/.cache/uv /root/.cache/uv

ENTRYPOINT [ "open-webui", "serve", "--host", "0.0.0.0", "--port", "8080" ]