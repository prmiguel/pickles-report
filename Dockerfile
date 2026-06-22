FROM alpine AS stage
WORKDIR /tool
ADD https://github.com/picklesdoc/pickles/releases/download/v4.0.3/Pickles-exe-linux-x64-4.0.3.zip Pickles.zip
RUN unzip Pickles.zip && chmod +x Pickles

FROM mcr.microsoft.com/powershell:lts-7.2-ubuntu-jammy AS runtime

LABEL org.opencontainers.image.title="Pickles In Docker"
LABEL org.opencontainers.image.description="Docker image for Pickles — living documentation generator from Gherkin feature files"
LABEL org.opencontainers.image.version="4.0.3"
LABEL org.opencontainers.image.url="https://github.com/prmiguel/pickles-report"
LABEL org.opencontainers.image.source="https://github.com/prmiguel/pickles-report"
LABEL org.opencontainers.image.licenses="Apache-2.0"

WORKDIR /pickles
RUN apt-get update && apt-get install -y --no-install-recommends libgdiplus \
    && rm -rf /var/lib/apt/lists/*
COPY --from=stage /tool/ /usr/local/bin/
ENTRYPOINT ["Pickles"]
