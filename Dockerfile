FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl tar && \
    rm -rf /var/lib/apt/lists/*

# COPY ./schwifty-linux.tar.gz .

# RUN tar -xzf schwifty-linux.tar.gz && rm schwifty-linux.tar.gz

COPY ./dist/schwifty .

ENTRYPOINT ["./schwifty"]