FROM ai-suite-base:latest

RUN git clone https://github.com/GeorgeAzma/tts.git /tts

WORKDIR /tts

RUN uv pip install -r requirements.txt

ENTRYPOINT [ "python3", "server.py" ]