# Dockerfile - LibreOffice document conversion service
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install LibreOffice and a comprehensive set of fonts
RUN apt-get update && apt-get install -y --no-install-recommends \
    libreoffice-core \
    libreoffice-writer \
    libreoffice-calc \
    libreoffice-impress \
    fonts-liberation \
    fonts-dejavu \
    fonts-noto \
    fonts-noto-cjk \
    fonts-noto-color-emoji \
    fonts-crosextra-carlito \
    fonts-crosextra-caladea \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for running LibreOffice
RUN useradd -m -s /bin/bash converter
USER converter

WORKDIR /docs

ENTRYPOINT ["libreoffice", "--headless", "--norestore"]