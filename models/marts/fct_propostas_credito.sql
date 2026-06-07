with
    fonte_propostas_credito as (
        select *
        from {{ ref('int_fato_propostas_credito') }}
    )
select *
from fonte_propostas_credito