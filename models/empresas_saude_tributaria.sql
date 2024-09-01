with ajustando_empresas_saude_tributaria as (
    select * from {{ source('reso_neoway_reso_neoway', 'empresas_saude_tributaria') }}
)

select
    regexp_replace(cnpj, '^\'', '') as cnpj,
    saude_tributaria
from ajustando_empresas_saude_tributaria