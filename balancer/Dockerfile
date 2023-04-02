FROM debian:latest
RUN apt-get update \
    && apt-get install -y --no-install-recommends ipvsadm curl tcpdump \
    && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["sleep", "infinity"]
