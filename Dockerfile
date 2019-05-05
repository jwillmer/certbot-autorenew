FROM certbot/certbot:v0.33.1
MAINTAINER Phillip Schichtel

ADD crontab /etc/crontabs
RUN crontab /etc/crontabs/crontab

COPY ./scripts/ /scripts
RUN chmod -R +x /scripts/

VOLUME /certs
VOLUME /etc/letsencrypt
EXPOSE 443

ENTRYPOINT ["/scripts/entrypoint.sh"]
