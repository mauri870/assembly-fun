FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:duggan/bats -y && \
    apt-get update -y && \
    apt-get install -y make yasm bats build-essential

CMD ["bash"]
