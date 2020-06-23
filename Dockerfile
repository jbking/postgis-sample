FROM python:3.8.3

ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
COPY . /code/
RUN apt-get update && apt-get install --yes --no-install-recommends binutils libproj-dev gdal-bin && \
    pip install --upgrade pip && \
    pip install -r requirements.txt
