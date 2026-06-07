with
    fonte_propostas_credito as (
        select *
        from {{ source('erp', 'propostas_credito') }}
    )

, renomeado as (
        select
            cast (cod_proposta as int) as pk_proposta
            , cast(cod_cliente as int) as fk_cliente
            , cast(cod_colaborador as int) as fk_colaborador
            , cast(data_entrada_proposta as date) as data_entrada
            , cast(cast(taxa_juros_mensal as double) * 100 as numeric(5,2)) as taxa_juros_mensal_percentual
            , cast(valor_proposta as numeric(28,2)) as valor_proposta
            , cast(valor_financiamento as numeric(28,2)) as valor_financiamento
            , cast(valor_entrada as numeric(28,2)) as valor_entrada
            , cast(valor_prestacao as numeric(28,2)) as valor_prestacao 
            , quantidade_parcelas
            , carencia
            , upper(status_proposta) as status_proposta
        from fonte_propostas_credito   
    )
select *
from renomeado