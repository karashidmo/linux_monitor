FROM ubuntu:22.04

RUN apt update && apt install -y \
    procps \
    coreutils \
    bc

WORKDIR /app

COPY scripts/ /app/scripts/

RUN mkdir -p /app/logs

RUN chmod +x /app/scripts/monitor.sh

CMD ["/app/scripts/monitor.sh"]
