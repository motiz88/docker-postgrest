#!/usr/bin/env bash

set -x

DBHOST=${DBHOST:-${POSTGRES_PORT_5432_TCP_ADDR:-"postgres"}}
DBNAME=${DBNAME:-${POSTGRES_ENV_POSTGRES_USER:-"postgres"}}
DBPORT=${DBPORT:-"5432"}

DBUSER=${DBUSER:-${POSTGRES_ENV_POSTGRES_USER:-"postgres"}}
DBPASS=${DBPASS:-${POSTGRES_ENV_POSTGRES_PASSWORD:-"postgres"}}
DBPOOL=${DBPOOL:-"200"}
PORT=${PORT:-"3000"}

SCHEMA=${SCHEMA:-"public"}

ANONUSER=${ANONUSER:-"postgres"}

SLEEP=${SLEEP:-"0"}

sleep "$SLEEP"

postgrest postgres://$DBUSER:$DBPASS@$DBHOST:$DBPORT/$DBNAME \
          --pool "$DBPOOL" \
          --port "$PORT" \
          --anonymous "$ANONUSER" \
          --schema "$SCHEMA"

