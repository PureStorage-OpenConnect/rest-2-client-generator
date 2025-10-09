FROM ubuntu:22.04
WORKDIR /source

RUN apt-get update && apt-get install -y default-jdk curl python3 python3-pip git


COPY ./requirements.txt .
RUN python3 -m pip install -r requirements.txt

COPY ./build.py .
COPY ./docker_entrypoint.sh .
COPY ./scripts ./scripts

RUN ["chmod", "+x", "/source/docker_entrypoint.sh"]

ENTRYPOINT ["/source/docker_entrypoint.sh"]
