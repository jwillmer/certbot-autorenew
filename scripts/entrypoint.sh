#!/bin/sh

if [ "$RUN_AT_START" = "true" ]
then
    # one-time execution at container start once host's health check is ok
    /scripts/run_certbot.sh
fi

# scheduling periodic executions
exec crond -f
