with ajustando_f_processos_juridicos as (
    select * from {{ source('reso_neoway_reso_neoway', 'f_processos_juridicos') }}
)

select
    case 
        when length(regexp_replace(cnpj, r'[^\d]', '')) < 14
        then lpad(concat(regexp_replace(cnpj, r'[^\d]', ''), '0000000000'), 14, '0')
        else regexp_replace(cast(cnpj as string), r'[^\d]', '') 
    end as cnpj,
    area,
    grauProcesso as grau_processo,
    case
        when trim(substr(comarca, 1, instr(comarca, ' - ') -1)) = ''
        then substr(comarca, instr(comarca, ' - ') + 3)
        else comarca 
    end as comarca, 
    julgamento,
    format_timestamp('%d/%m/%Y', dataDecisao) as data_decisao,
    format_timestamp('%d/%m/%Y', dataEncerramento) as data_encerramento,
    uf,
    tribunal,
    ultimoEstado as ultimo_estado,
    case
        when trim(substr(orgaoJulgador, 1, instr(orgaoJulgador, ' - ') -1)) = ''
        then substr(orgaoJulgador, instr(orgaoJulgador, ' - ') + 3)
        else orgaoJulgador 
    end as orgao_julgador,
    citacaoTipo as citacao_tipo,
    (select codigoCNJ from unnest(assuntosCNJ) limit 1) as codigo_CNJ,
    (select codigoLocal from unnest(assuntosCNJ) limit 1) as codigo_local,
    (select titulo from unnest(assuntosCNJ) limit 1) as titulo,
    string_agg(partes.nomeNormalizadoNeoway, ', ') as nome_normalizado_neoway,
    string_agg(partes.polo, ', ') as polo,
    replace(format('%.2f', valorCausa), '.', ',') as valor_causa,
    replace(format('%.2f', valorPredicaoCondenacao), '.', ',') as valor_predicao_condenacao,
    unidadeOrigem as unidade_origem,
    juiz
from ajustando_f_processos_juridicos,
unnest(partes) as partes

group by 
cnpj, area, grauProcesso, comarca, julgamento, dataDecisao, dataEncerramento,
uf, tribunal, ultimoEstado, orgaoJulgador, citacaoTipo, unidadeOrigem, juiz, assuntosCNJ, valorCausa, valorPredicaoCondenacao