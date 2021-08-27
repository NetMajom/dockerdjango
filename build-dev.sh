#!/usr/bin/env bash
DJANGO_SETTINGS_MODULE=dockerdjango.settings.dev \
# 50 character string
DJANGO_SECRET_KEY=bmE4lIxWHfR5Nw34nMDygm5KJ7nHquvNJMdroVYH1inh1FJJPB \
DATABASE_NAME=dockerdjango \
DATABASE_USER=dockerdjango \
DATABASE_PASSWORD=dockerdjango \
EMAIL_HOST="localhost" \
EMAIL_PORT="25" \
EMAIL_HOST_USER="" \
EMAIL_HOST_PASSWORD="" \
PIP_REQUIREMENTS=dev.txt \
docker-compose up --detach --build