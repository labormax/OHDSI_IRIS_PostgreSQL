ARG IMAGE=postgres:13.6-alpine
FROM $IMAGE

COPY ./init/ /docker-entrypoint-initdb.d/
