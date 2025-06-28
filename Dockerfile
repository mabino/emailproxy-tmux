FROM alpine:latest

ENV PATH="/venv/bin:$PATH"
#ENV PROXY_COMMAND="/venv/bin/python /emailproxy/emailproxy.py --config-file /emailproxy/config/emailproxy.config --cache-store /emailproxy/config/credstore.config --no-gui --local-server-auth"
ENV PROXY_COMMAND="/venv/bin/python /emailproxy/emailproxy.py --config-file /emailproxy/config/emailproxy.config --cache-store /emailproxy/config/credstore.config --no-gui --external-auth"
ENV TERM=xterm-256color
ENV VIRTUAL_ENV="/venv"

COPY emailproxy.py /emailproxy/

RUN apk update && apk add --no-cache \
    python3 \
    py3-pip \
#    build-base \
#    libffi-dev \
#    openssl-dev \
    tmux \
    bash \
    util-linux \
    procps \
    && python3 -m venv /venv \
    && . /venv/bin/activate \
    && pip install 'cryptography>=2.2' pyasyncore prompt_toolkit 'pyjwt>=2.4' \
    --no-warn-script-location --disable-pip-version-check

# Set TERM environment variable for tmux
ENV TERM=xterm-256color

# Start a tmux session and keep it running

CMD ["sh", "-c", "tmux new-session -d -s emailproxy '$PROXY_COMMAND' && tail -f /dev/null"]
