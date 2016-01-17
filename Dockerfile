FROM ubuntu:trusty

RUN apt-get update && apt-get install --no-install-recommends -y xz-utils curl libpq-dev libgmp10 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD postgrest /usr/local/bin/

EXPOSE 3000

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]

#CMD ["sh", "-c", "postgrest", "--db-name", "postgres", "--db-port", "5432", "--db-user", "postgres", "--db-pass", "$POSTGRES_PASSWORD", "--db-host", "postgis", "--db-pool", "200", "-a", "postgres"]
