with ajustando_empresas_simples as (
    select * from {{ source('reso_neoway_reso_neoway', 'empresas_simples') }}
)

select
    regexp_replace(cnpj, '^\'', '') as cnpj,
    optante_simples,
    optante_simei
from ajustando_empresas_simples
