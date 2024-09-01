with ajustando_empresas_nivel_atividade as (
    select * from {{ source('reso_neoway_reso_neoway', 'empresas_nivel_atividade') }}
)

select
    regexp_replace(cnpj, '^\'', '') as cnpj,
    nivel_atividade
from ajustando_empresas_nivel_atividade