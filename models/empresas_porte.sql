with ajustando_empresas_porte as (
    select * from {{ source('reso_neoway_reso_neoway', 'empresas_porte') }}
)

select
    regexp_replace(cnpj, '^\'', '') as cnpj,
    empresa_porte
from ajustando_empresas_porte