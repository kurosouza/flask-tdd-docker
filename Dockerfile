FROM python:3.7.4-alpine

RUN apk update && \
   apk add --virtual build-deps gcc python-dev musl-dev && \
   apk add postgresql-dev && \
   apk add netcat-openbsd

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

COPY ./entrypoint.sh /usr/src/app/entrypoint.sh

RUN chmod +x /usr/src/app/entrypoint.sh

COPY . /usr/src/app

# COPY . .

# CMD python manage.py run -h 0.0.0.0
