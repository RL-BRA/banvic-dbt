with
    fonte_propostas_credito as (
        select *
        from {{ ref('stg_erp__propostas_credito') }}
    )

    , clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    )

    , propostas_enriquecidas as (
        select
            fonte_propostas_credito.pk_proposta
            , data_entrada
            , taxa_juros_mensal_percentual
            , valor_proposta
            , valor_financiamento
            , valor_prestacao
            , carencia
            , quantidade_parcelas
            , status_proposta
            , clientes.pk_cliente as cliente_propostas_credito
            , clientes.tipo_cliente as tipo_cliente_proposta
            , case
                when clientes.tipo_cliente = 'PJ' and fonte_propostas_credito.valor_proposta > 100000 then 'Crédito corporativo'
                else 'Crédito varejo'
            end as perfil_proposta
        from fonte_propostas_credito
        left join clientes on fonte_propostas_credito.fk_cliente = clientes.pk_cliente 
    )

select *
from propostas_enriquecidas