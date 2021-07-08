FROM certbot/certbot:v1.7.0

LABEL maintainer="Jens Willmer <info@jwillmer.de>"

RUN apk add --no-cache docker-cli curl

RUN pip install certbot-dns-cloudflare
#RUN certbot-dns-cloudxns
#RUN certbot-dns-digitalocean
#RUN certbot-dns-dnsimple
#RUN certbot-dns-dnsmadeeasy
#RUN certbot-dns-gehirn
#RUN certbot-dns-google
#RUN certbot-dns-linode
#RUN certbot-dns-luadns
#RUN certbot-dns-nsone
#RUN certbot-dns-ovh
#RUN certbot-dns-rfc2136
#RUN certbot-dns-route53
#RUN certbot-dns-sakuracloud

ADD crontab /etc/crontabs
RUN crontab /etc/crontabs/crontab

COPY ./scripts/ /scripts
RUN chmod -R +x /scripts/

VOLUME /certs
VOLUME /etc/letsencrypt
EXPOSE 443

ENTRYPOINT ["/scripts/entrypoint.sh"]
