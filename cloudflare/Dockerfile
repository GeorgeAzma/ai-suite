FROM alpine:latest AS config

ARG TUNNEL_NAME
ARG DOMAIN_NAME

RUN mkdir -p /cloudflare
RUN echo "tunnel: ${TUNNEL_NAME}" > "/cloudflare/config.yml" && \
    echo "credentials-file: /cloudflare/credentials.json" >> "/cloudflare/config.yml" && \
    echo "origincert: /cloudflare/cert.pem" >> "/cloudflare/config.yml" && \
    echo "ingress:" >> "/cloudflare/config.yml" && \
    echo "  - hostname: ${DOMAIN_NAME}" >> "/cloudflare/config.yml" && \
    echo "    service: http://open-webui:8080" >> "/cloudflare/config.yml" && \
    echo "  - hostname: chat.${DOMAIN_NAME}" >> "/cloudflare/config.yml" && \
    echo "    service: http://open-webui:8080" >> "/cloudflare/config.yml" && \
    echo "  - hostname: image.${DOMAIN_NAME}" >> "/cloudflare/config.yml" && \
    echo "    service: http://comfyui:8188" >> "/cloudflare/config.yml" && \
    echo "  - hostname: tts.${DOMAIN_NAME}" >> "/cloudflare/config.yml" && \
    echo "    service: http://tts:5000" >> "/cloudflare/config.yml" && \
    echo "  - hostname: stt.${DOMAIN_NAME}" >> "/cloudflare/config.yml" && \
    echo "    service: http://stt:5001" >> "/cloudflare/config.yml" && \
    echo "  - service: http_status:404" >> "/cloudflare/config.yml"


FROM cloudflare/cloudflared:latest

COPY --from=config /cloudflare/config.yml /cloudflare/config.yml

ENTRYPOINT [ "cloudflared", "tunnel", "--no-autoupdate", "--protocol", "http2", "--config", "/cloudflare/config.yml", "run" ]