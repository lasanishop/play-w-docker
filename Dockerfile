FROM python:3.8-slim-buster

WORKDIR /app

ADD . /app/

ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip 
RUN pip install -r requirements.txt

EXPOSE 8000

CMD gunicorn django_docker.wsgi:application --bind 0.0.0.0:8000