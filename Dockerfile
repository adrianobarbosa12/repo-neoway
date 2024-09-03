FROM python:3.9-slim

RUN pip install dbt-bigquery

WORKDIR /usr/app

COPY . .

ENTRYPOINT ["dbt"]