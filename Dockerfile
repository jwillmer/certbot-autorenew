FROM certbot/certbot:v1.7.0

LABEL maintainer="Jens Willmer <info@jwillmer.de>"

RUN apk add --no-cache docker-cli curl

# Supported Plugins
RUN pip install certbot-dns-cloudflare
RUN pip install certbot-dns-cloudxns
RUN pip install certbot-dns-digitalocean
RUN pip install certbot-dns-dnsimple
RUN pip install certbot-dns-dnsmadeeasy
RUN pip install certbot-dns-gehirn
RUN pip install certbot-dns-google
RUN pip install certbot-dns-linode
RUN pip install certbot-dns-luadns
RUN pip install certbot-dns-nsone
RUN pip install certbot-dns-ovh
RUN pip install certbot-dns-rfc2136
RUN pip install certbot-dns-route53
RUN pip install certbot-dns-sakuracloud

ADD crontab /etc/crontabs
RUN crontab /etc/crontabs/crontab

COPY ./scripts/ /scripts
RUN chmod -R +x /scripts/

VOLUME /certs
VOLUME /etc/letsencrypt
EXPOSE 443

ENTRYPOINT ["/scripts/entrypoint.sh"]
