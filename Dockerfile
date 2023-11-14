FROM python:3.9.2-slim-buster

RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive

RUN apt -qq update && \
    apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo neofetch

RUN apt-get install cmake build-essential -y -f && \
    git clone --branch v3.1.0 --depth 1 https://aomedia.googlesource.com/aom.git && \
    cd aom && \
    mkdir build && cd build && \
    cmake .. && make && make install && \
    cd ../.. && rm -rf aom

COPY . .

RUN pip3 install -r requirements.txt

CMD ["bash", "run.sh"]
