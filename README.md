 # Contexto

 Esse projeto consiste em realizar a analise de dados de processos jurídicos de empresas brasileiras através de bases de dados disponíveis em formatos `.CSV` e `.Json`. Essas bases passaram por uma série de tratamentos para que os dados sejam refletidos em dashboard para a melhor tomada de decisão.

 Para o desenvolvimento desse projeto foram utilizadas as ferramentas: 
- `DBT` para transformação de dados (Processos de ETL)
- `SQL` para gerenciamento e manipulação dos dados
- `Power BI` para criação de dashboard
- `BigQuery` como data warehouse

Português | [Inglês](./README-en_US.md)

# QuickStart
## Instalação de pacotes e dependências

Será necessária a instalação do Python versão 3 em diante.
[Link de instalação](https://www.python.org/downloads/)

Instalação da dependência dbt-bigquery
```bash
$ pip install dbt-bigquery
```

:warning: 
Atenção! Antes de executar o projeto, deverá inserir as credenciais enviadas no [Time Secret](https://onetimesecret.com/secret/4787trnegpnwxaarsxbt1f0kjv3e94f) no arquivo [credentials.json](./credentials.json). Utilizar senha de acesso enviada por e-mail. :warning:

Para executar o projeto  
```bash
$ dbt run 
```

Este comando irá ler os dados que estão armazenados em um dataset em nuvem, fará o tratamento dos dados gerando as views que serão consumidas pelo dashboard.

Mensagem de sucesso ao executar o projeto: 
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

# Executando o projeto com Docker
Para executar o projeto com docker deverá executar o comando
```bash
$ docker-compose up
```