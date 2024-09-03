 # Context

This project involves analyzing legal process data from Brazilian companies using datasets available in `.CSV` and `.JSON` formats. These datasets have undergone various transformations to be visualized on a dashboard for better decision-making.

The following tools were used for the development of this project:
- `DBT` for data transformation (ETL processes)
- `SQL` for data management and manipulation
- `Power BI` for dashboard creation
- `BigQuery` as the data warehouse

[Portuguese](./README.md]) | English

# QuickStart
## Installing Packages and Dependencies

You will need to install Python version 3 or later
[Installation Link](https://www.python.org/downloads/)

Install the dbt-bigquery dependency:
```bash
$ pip install dbt-bigquery
``` 

:warning: 
Important! Before running the project, you must insert the credentials sent to you in the [Time Secret](https://onetimesecret.com/secret/4787trnegpnwxaarsxbt1f0kjv3e94f) into the [credentials.json](./credentials.json) file. Use the access password sent via email. :warning:

To run the project: 
```bash
$ dbt run 
```

This command will read the data stored in a cloud dataset, process the data, and generate the views that will be consumed by the dashboard.

Success message upon running the project:
```bash
1 of 6 START sql view model reso_neoway_reso_neoway_reso_neoway.df_empresas .... [RUN]
1 of 6 OK created sql view model reso_neoway_reso_neoway_reso_neoway.df_empresas  [CREATE VIEW (0 processed) in 2.24s]
2 of 6 START sql view model reso_neoway_reso_neoway_reso_neoway.empresas_nivel_atividade  [RUN]
2 of 6 OK created sql view model reso_neoway_reso_neoway_reso_neoway.empresas_nivel_atividade  [CREATE VIEW (0 processed) in 1.98s]
3 of 6 START sql view model reso_neoway_reso_neoway_reso_neoway.empresas_porte . [RUN]
3 of 6 OK created sql view model reso_neoway_reso_neoway_reso_neoway.empresas_porte  [CREATE VIEW (0 processed) in 2.03s]
4 of 6 START sql view model reso_neoway_reso_neoway_reso_neoway.empresas_saude_tributaria  [RUN]
4 of 6 OK created sql view model reso_neoway_reso_neoway_reso_neoway.empresas_saude_tributaria  [CREATE VIEW (0 processed) in 1.98s]
5 of 6 START sql view model reso_neoway_reso_neoway_reso_neoway.empresas_simples  [RUN]
5 of 6 OK created sql view model reso_neoway_reso_neoway_reso_neoway.empresas_simples  [CREATE VIEW (0 processed) in 2.04s]
6 of 6 START sql view model reso_neoway_reso_neoway_reso_neoway.f_processos_juridicos  [RUN]
6 of 6 OK created sql view model reso_neoway_reso_neoway_reso_neoway.f_processos_juridicos  [CREATE VIEW (0 processed) in 2.05s]

Finished running 6 view models in 0 hours 0 minutes and 17.14 seconds (17.14s).

Completed successfully
```

# Running the Project with Docker
To run the project using Docker, execute the following command:
```bash
$ docker-compose up
```