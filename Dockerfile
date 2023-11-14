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

COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Download and install Telethon from GitHub
RUN wget https://github.com/1Danish-00/Telethon/archive/master.zip && \
    unzip master.zip && \
    rm master.zip && \
    mv Telethon-master telethon && \
    cd telethon && \
    pip3 install .

# Install html_telegraph_poster
RUN pip3 install html-telegraph-poster
CMD ["bash", "run.sh"]
