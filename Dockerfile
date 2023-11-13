FROM python:3.11-buster
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
WORKDIR /app
ENV PIP_NO_CACHE_DIR=1 PYTHONUNBUFFERED=1 TZ=Asia/Kolkata
RUN apt-get update && apt-get upgrade -y
RUN python3 -m pip install -U pip
RUN pip3 install -U wheel setuptools
RUN apt install -y ffmpeg apt-utils build-essential python3-dev
COPY . .
RUN pip3 install --no-cache-dir -U -r requirements.txt
RUN apt update && apt autoremove -y
RUN apt clean && rm -rf /var/lib/apt/lists/* ~/.thumbs/* ~/.cache
CMD python3 -m AnonXMusic
