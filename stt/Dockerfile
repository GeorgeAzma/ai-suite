FROM ai-suite-base:latest

RUN git clone https://github.com/GeorgeAzma/stt.git /stt

WORKDIR /stt

RUN uv pip install -r requirements.txt

ENTRYPOINT [ "python3", "server.py" ]