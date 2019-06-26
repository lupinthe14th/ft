FROM python:3-alpine

LABEL maintainer="Hideo Suzuki <hideosuzuki@ordinarius-fectum.net>"

WORKDIR /usr/src/app

COPY . .

RUN apk add --update --no-cache --virtual .build-deps \
			g++ \
			gcc \
			musl-dev \
	\
	&& pip install --no-cache-dir --upgrade pip \
	&& pip install --no-cache-dir --upgrade pipenv \
	&& pipenv install \
	\
	&& apk del .build-deps
