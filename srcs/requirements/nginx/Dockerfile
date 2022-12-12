FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install dumb-init

RUN apt-get clean -y

EXPOSE 443

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/bin/bash", "-l" ]
