FROM alpine:3.10

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && apk update
RUN apk add openvas-scanner gvmd ospd

ADD run.sh /run.sh
ADD openvas-docker-setup.sh /openvas-docker-setup.sh

RUN /openvas-docker-setup.sh && rm -f /openvas-docker-setup.sh

ADD config/redis.conf /etc/redis.conf
RUN apk add bash
CMD ["bash", "/run.sh"]

EXPOSE 443
