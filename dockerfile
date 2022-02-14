FROM debian:bullseye-slim
LABEL maintainer "Jessie Frazelle <jess@linux.com>"

RUN apt-get update && apt-get install -y \
    gcc \
    libc6-dev \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*


# Added by BP

RUN apt update 

RUN apt install make -y

RUN apt install git -y

RUN apt-get install mingw-w64=6.3.0-1 -y