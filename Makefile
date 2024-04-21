include .env

.PHONY: api-run db db-test reload local-db install


all: local-db install api-run

#######
# API #
#######

ifndef PORT
override PORT = 8000
endif

api-run:
	@uvicorn app.main:app --reload --log-level info --port ${PORT}

############
# LOCAL DB #
############

SERVICES := db
SERVICES_DEV := db db-test

compress:
	@tar -czf ${DB_INGESTION_DIR}/data/base.tar.gz ${DB_INGESTION_DIR}/raw/pokedex/base.csv && \
	tar -czf ${DB_INGESTION_DIR}/data/against.tar.gz ${DB_INGESTION_DIR}/raw/pokedex/against.csv

local-db:
# Start local db.
	@rm -rf ${DB_INGESTION_DIR}/.storages/db && docker compose up ${SERVICES} -d

reload:
# Reload local databases.
	@docker compose down ${SERVICES_DEV} && rm -rf ${DB_INGESTION_DIR}/.storages/* && docker compose up ${SERVICES_DEV} -d


################
# DB CONNECTOR #
################

db:
	@psql -d postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}
db-test:
	@psql -d postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:5433/${DB_NAME}

install:
	@pip install -r requirements.txt