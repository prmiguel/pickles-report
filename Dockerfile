FROM alpine as stage
WORKDIR /tool
ADD https://github.com/picklesdoc/pickles/releases/download/v4.0.3/Pickles-exe-linux-x64-4.0.3.zip Pickles.zip
RUN unzip Pickles.zip
RUN chmod +x Pickles

FROM mcr.microsoft.com/powershell:lts-7.2-ubuntu-jammy
WORKDIR /pickles
RUN apt-get update && apt-get install -y libgdiplus
COPY --from=stage /tool/ /usr/local/bin/
ENTRYPOINT ["Pickles"]
