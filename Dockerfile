FROM certbot/certbot:v1.7.0

LABEL maintainer="Phillip Schichtel <phillip@schich.tel>"

RUN apk update \
 && apk add docker-cli

ADD crontab /etc/crontabs
RUN crontab /etc/crontabs/crontab

COPY ./scripts/ /scripts
RUN chmod -R +x /scripts/

VOLUME /certs
VOLUME /etc/letsencrypt
EXPOSE 443

ENTRYPOINT ["/scripts/entrypoint.sh"]
