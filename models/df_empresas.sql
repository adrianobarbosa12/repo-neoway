with ajustando_df_empresas as (
    select * from {{ source('reso_neoway_reso_neoway', 'df_empresas') }}
)

select
    case 
        when length(regexp_replace(cnpj, r'[^\d]', '')) < 14
        then lpad(concat(regexp_replace(cnpj, r'[^\d]', ''), '0000000000'), 14, '0')
        else regexp_replace(cast(cnpj as string), r'[^\d]', '') 
    end as cnpj,
    case
        when regexp_contains(dt_abertura, r'\d{4}-\d{2}-\d{2}') then format_date('%d/%m/%Y', parse_date('%Y-%m-%d', dt_abertura))
        when regexp_contains(dt_abertura, r'\d{2}/\d{2}/\d{4}') then dt_abertura
        else null
    end as dt_abertura,
    matriz_empresaMatriz,
    regexp_replace(cd_cnae_principal, r'^\'', '') as cd_cnae_principal,
    de_cnae_principal,
    de_ramo_atividade,
    de_setor,
    regexp_replace(endereco_cep, r'^\'', '') as endereco_cep,
    endereco_municipio,
    endereco_uf,
    endereco_regiao,
    endereco_mesorregiao,
    situacao_cadastral
from ajustando_df_empresas
