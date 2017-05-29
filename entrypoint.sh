#!/usr/bin/env bash

set -x

DBHOST=${DBHOST:-${POSTGRES_PORT_5432_TCP_ADDR:-"postgres"}}
DBNAME=${DBNAME:-${POSTGRES_ENV_POSTGRES_USER:-"postgres"}}
DBPORT=${DBPORT:-"5432"}

DBUSER=${DBUSER:-${POSTGRES_ENV_POSTGRES_USER:-"postgres"}}
DBPASS=${DBPASS:-${POSTGRES_ENV_POSTGRES_PASSWORD:-"postgres"}}
PORT=${PORT:-"3000"}

SCHEMA=${SCHEMA:-"public"}

ANONUSER=${ANONUSER:-"postgres"}

SLEEP=${SLEEP:-"0"}

sleep "$SLEEP"

echo "db-uri    = postgres://${DBUSER}:${DBPASS}@${DBHOST}:${DBPORT}/${DBNAME}
      db-schema = ${SCHEMA}
      db-anon-role = ${ANONUSER}
      port         = ${PORT}
" >> ./postgrest.conf

postgrest ./postgrest.conf

