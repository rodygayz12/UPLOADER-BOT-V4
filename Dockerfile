# Use the official Python image
FROM python:3.9-slim-buster
WORKDIR . .
COPY . .
ENV ENV PYTHONUNBUFFERED=1
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ffmpeg

CMD gunicorn app:app & python3 bot.py
