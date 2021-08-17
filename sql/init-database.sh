#!/usr/bin/env bash

psql -U docker -d postgre < "/docker-entrypoint-initdb.d/create-tables.sql"
psql -U docker -d postgre < "/docker-entrypoint-initdb.d/insert-data.sql"