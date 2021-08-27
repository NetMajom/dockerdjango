@echo off

SET DJANGO_SETTINGS_MODULE=dockerdjango.settings.dev
@REM 50 character string
SET DJANGO_SECRET_KEY=bmE4lIxWHfR5Nw34nMDygm5KJ7nHquvNJMdroVYH1inh1FJJPB
SET DATABASE_NAME=dockerdjango
SET DATABASE_USER=dockerdjango
SET DATABASE_PASSWORD=dockerdjango
SET EMAIL_HOST=localhost
SET EMAIL_PORT=25
SET EMAIL_HOST_USER=""
SET EMAIL_HOST_PASSWORD=""
SET PIP_REQUIREMENTS=dev.txt
docker-compose up --detach --build