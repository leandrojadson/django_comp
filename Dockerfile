FROM python:3.8

RUN apt update && apt install -y --no-install-recommends gcc default-jre git wget curl zsh fonts-powerline make

RUN useradd -ms /bin/bash python

ENV ROOT_PACKAGES=/home/python/app/__pypackages__/3.8
ENV PATH $PATH:${ROOT_PACKAGES}/bin

#ENV PYTHONPATH=${PYTHONPATH}/home/python/app/src/__core:/home/python/app/src/django_app
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONFAULTHANDLER=1

ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

RUN pip install pdm

USER python

RUN mkdir /home/python/app

WORKDIR /home/python/app

RUN /bin/bash -c "pdm --pep582 >>  ~/.bashrc"
