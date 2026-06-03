with
    contas as (
        select *
        from {{ ref('stg_erp__contas') }}
    )

    , lselecionar_coluna as (
        select
            pk_conta
            , fk_cliente
            , fk_agencia
            , fk_colaborador
            , saldo_total
            , saldo_disponivel
            , ultimo_lancamento
        from contas
    )

select *
from contas