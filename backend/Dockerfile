FROM python:3.8.9
ARG WORK_DIR
ARG BACK_PROJECT_NAME
WORKDIR ${WORK_DIR}
ENV DOCKERIZE_VERSION v0.6.1

COPY . .
RUN pip3 install pipenv
RUN cd ${BACK_PROJECT_NAME} && pipenv install -r ./requirements.txt

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz