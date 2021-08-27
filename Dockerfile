FROM python:3.8
ARG PIP_REQUIREMENTS=production.txt
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN pip install --upgrade pip setuptools
RUN useradd -ms /bin/bash dockerdjango
USER dockerdjango
WORKDIR /home/dockerdjango
RUN python3 -m venv env
COPY --chown=dockerdjango ./src/dockerdjango/requirements /home/dockerdjango/requirements/
RUN ./env/bin/pip3 install -r /home/dockerdjango/requirements/${PIP_REQUIREMENTS}
COPY --chown=dockerdjango ./src/dockerdjango /home/dockerdjango/
